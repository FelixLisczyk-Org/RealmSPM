#!/bin/bash

# Enhanced test script to validate Package.swift manifest replacement logic for both scenarios

set -e

echo "🧪 Testing Package.swift manifest replacement logic for both new and existing manifests..."

# Test values
REALM_URL="https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta/Realm.xcframework.zip"
REALMSWIFT_URL="https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta/RealmSwift.xcframework.zip"
REALM_CHECKSUM="new-realm-checksum-for-6-2-beta"
REALMSWIFT_CHECKSUM="new-realmswift-checksum-for-6-2-beta"

echo "=== SCENARIO 1: New manifest from template (placeholders) ==="
# Create test manifest from template
cp templates/Package.swift.template test_new_manifest.swift
sed -i '' 's/SWIFT_VERSION_PLACEHOLDER/6.2/g' test_new_manifest.swift
sed -i '' "s|REALM_URL_PLACEHOLDER|https://example.com/placeholder/Realm.xcframework.zip|g" test_new_manifest.swift
sed -i '' "s|REALMSWIFT_URL_PLACEHOLDER|https://example.com/placeholder/RealmSwift.xcframework.zip|g" test_new_manifest.swift
sed -i '' "s|REALM_CHECKSUM_PLACEHOLDER|placeholder-realm-checksum|g" test_new_manifest.swift
sed -i '' "s|REALMSWIFT_CHECKSUM_PLACEHOLDER|placeholder-realmswift-checksum|g" test_new_manifest.swift

echo "📄 New manifest (before replacement):"
echo "----------------------------------------"
cat test_new_manifest.swift
echo "----------------------------------------"

# Apply current logic (should work for new manifests)
sed -i '' "s|url: \"[^\"]*Realm\.xcframework\.zip\"|url: \"$REALM_URL\"|g" test_new_manifest.swift
sed -i '' "s|url: \"[^\"]*RealmSwift\.xcframework\.zip\"|url: \"$REALMSWIFT_URL\"|g" test_new_manifest.swift
sed -i '' "s|checksum: \"placeholder-realm-checksum\"|checksum: \"$REALM_CHECKSUM\"|g" test_new_manifest.swift
sed -i '' "s|checksum: \"placeholder-realmswift-checksum\"|checksum: \"$REALMSWIFT_CHECKSUM\"|g" test_new_manifest.swift

echo "✅ New manifest (after replacement):"
echo "----------------------------------------"
cat test_new_manifest.swift
echo "----------------------------------------"

echo "=== SCENARIO 2: Existing manifest (real checksums) ==="
# Copy the existing 6.2 manifest
cp Package@swift-6.2.swift test_existing_manifest.swift

echo "📄 Existing manifest (before replacement):"
echo "----------------------------------------"
cat test_existing_manifest.swift
echo "----------------------------------------"

# Apply current logic (will fail for checksums)
sed -i '' "s|url: \"[^\"]*Realm\.xcframework\.zip\"|url: \"$REALM_URL\"|g" test_existing_manifest.swift
sed -i '' "s|url: \"[^\"]*RealmSwift\.xcframework\.zip\"|url: \"$REALMSWIFT_URL\"|g" test_existing_manifest.swift
sed -i '' "s|checksum: \"placeholder-realm-checksum\"|checksum: \"$REALM_CHECKSUM\"|g" test_existing_manifest.swift
sed -i '' "s|checksum: \"placeholder-realmswift-checksum\"|checksum: \"$REALMSWIFT_CHECKSUM\"|g" test_existing_manifest.swift

echo "❌ Existing manifest (after current logic - checksums not updated):"
echo "----------------------------------------"
cat test_existing_manifest.swift
echo "----------------------------------------"

echo "=== SCENARIO 3: Enhanced logic for existing manifests ==="
# Reset existing manifest  
cp Package@swift-6.2.swift test_enhanced_manifest.swift

# Enhanced logic - update URLs and checksums for existing manifests
sed -i '' "s|url: \"[^\"]*Realm\.xcframework\.zip\"|url: \"$REALM_URL\"|g" test_enhanced_manifest.swift
sed -i '' "s|url: \"[^\"]*RealmSwift\.xcframework\.zip\"|url: \"$REALMSWIFT_URL\"|g" test_enhanced_manifest.swift

# For existing manifests, replace any checksum that follows a Realm URL
sed -i '' "/url:.*Realm\.xcframework\.zip/,/checksum:/ s|checksum: \"[^\"]*\"|checksum: \"$REALM_CHECKSUM\"|" test_enhanced_manifest.swift
sed -i '' "/url:.*RealmSwift\.xcframework\.zip/,/checksum:/ s|checksum: \"[^\"]*\"|checksum: \"$REALMSWIFT_CHECKSUM\"|" test_enhanced_manifest.swift

echo "✅ Existing manifest (after enhanced logic - checksums updated):"
echo "----------------------------------------"
cat test_enhanced_manifest.swift
echo "----------------------------------------"

# Validation checks
echo "🔍 Validation checks for enhanced logic:"

if grep -q "$REALM_URL" test_enhanced_manifest.swift && grep -q "$REALMSWIFT_URL" test_enhanced_manifest.swift; then
    echo "✅ URLs correctly updated"
else
    echo "❌ URLs missing or incorrect"
fi

if grep -q "$REALM_CHECKSUM" test_enhanced_manifest.swift && grep -q "$REALMSWIFT_CHECKSUM" test_enhanced_manifest.swift; then
    echo "✅ Checksums correctly updated"
else
    echo "❌ Checksums missing or incorrect" 
fi

# Cleanup
rm -f test_new_manifest.swift test_existing_manifest.swift test_enhanced_manifest.swift

echo "🎉 Enhanced test completed!"