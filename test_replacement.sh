#!/bin/bash

# Test script to validate Package.swift manifest replacement logic

set -e

echo "🧪 Testing Package.swift manifest replacement logic..."

# Create test manifest from template
cp templates/Package.swift.template test_manifest.swift

# Replace Swift version placeholder
sed -i '' 's/SWIFT_VERSION_PLACEHOLDER/6.1.2/g' test_manifest.swift

# Set initial placeholder values (as done in workflow)
sed -i '' 's|REALM_URL_PLACEHOLDER|https://example.com/placeholder/Realm.xcframework.zip|g' test_manifest.swift
sed -i '' 's|REALMSWIFT_URL_PLACEHOLDER|https://example.com/placeholder/RealmSwift.xcframework.zip|g' test_manifest.swift
sed -i '' 's|REALM_CHECKSUM_PLACEHOLDER|placeholder-realm-checksum|g' test_manifest.swift
sed -i '' 's|REALMSWIFT_CHECKSUM_PLACEHOLDER|placeholder-realmswift-checksum|g' test_manifest.swift

echo "📄 Initial test manifest after placeholder replacement:"
echo "----------------------------------------"
cat test_manifest.swift
echo "----------------------------------------"

# Test the replacement logic (simulating workflow)
REALM_URL="https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.1.2-Stable/Realm.xcframework.zip"
REALMSWIFT_URL="https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.1.2-Stable/RealmSwift.xcframework.zip"
REALM_CHECKSUM="042916c32824c799c68059af7d6a85dd711269930c7851088a0189b1f49d65e5"
REALMSWIFT_CHECKSUM="881c2d96b504cca1fd36a063e0939b104d08528cb0afce39c3059cbc4141e058"

echo "🔄 Testing current Perl replacement logic..."

# Copy for testing current logic
cp test_manifest.swift test_current.swift

# Current workflow logic
perl -i -pe "s|url: \"[^\"]*Realm\.xcframework\.zip\"|url: \"$REALM_URL\"|g" test_current.swift
perl -i -pe "s|url: \"[^\"]*RealmSwift\.xcframework\.zip\"|url: \"$REALMSWIFT_URL\"|g" test_current.swift
perl -i -pe "BEGIN{undef $/;} s|(url: \"[^\"]*Realm\.xcframework\.zip\",\s*checksum: \")[^\"]*(\")|\$1$REALM_CHECKSUM\$2|gs" test_current.swift
perl -i -pe "BEGIN{undef $/;} s|(url: \"[^\"]*RealmSwift\.xcframework\.zip\",\s*checksum: \")[^\"]*(\")|\$1$REALMSWIFT_CHECKSUM\$2|gs" test_current.swift

echo "❌ Result with current logic:"
echo "----------------------------------------"
cat test_current.swift
echo "----------------------------------------"

# Test improved logic
echo "🔄 Testing improved replacement logic..."

cp test_manifest.swift test_improved.swift

# Improved logic - more precise replacements
sed -i '' "s|url: \"[^\"]*Realm\.xcframework\.zip\"|url: \"$REALM_URL\"|g" test_improved.swift
sed -i '' "s|url: \"[^\"]*RealmSwift\.xcframework\.zip\"|url: \"$REALMSWIFT_URL\"|g" test_improved.swift
sed -i '' "s|checksum: \"placeholder-realm-checksum\"|checksum: \"$REALM_CHECKSUM\"|g" test_improved.swift  
sed -i '' "s|checksum: \"placeholder-realmswift-checksum\"|checksum: \"$REALMSWIFT_CHECKSUM\"|g" test_improved.swift

echo "✅ Result with improved logic:"
echo "----------------------------------------"
cat test_improved.swift
echo "----------------------------------------"

# Validate the result
echo "🔍 Validation checks:"

# Check if URLs are present
if grep -q "$REALM_URL" test_improved.swift && grep -q "$REALMSWIFT_URL" test_improved.swift; then
    echo "✅ URLs correctly inserted"
else
    echo "❌ URLs missing or incorrect"
fi

# Check if checksums are present  
if grep -q "$REALM_CHECKSUM" test_improved.swift && grep -q "$REALMSWIFT_CHECKSUM" test_improved.swift; then
    echo "✅ Checksums correctly inserted"
else
    echo "❌ Checksums missing or incorrect" 
fi

# Check if syntax is valid
if swift package dump-package --package-path . --manifest-path test_improved.swift >/dev/null 2>&1; then
    echo "✅ Swift Package Manager syntax is valid"
else
    echo "❌ Swift Package Manager syntax is invalid"
    echo "Validation error:"
    swift package dump-package --package-path . --manifest-path test_improved.swift 2>&1 || true
fi

# Cleanup
rm -f test_manifest.swift test_current.swift test_improved.swift

echo "🎉 Test completed!"