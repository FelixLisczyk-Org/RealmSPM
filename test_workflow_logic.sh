#!/bin/bash

# Test the exact workflow logic for both scenarios

set -e

echo "🧪 Testing workflow replacement logic for both new and existing manifests..."

# Test values matching workflow format
REALM_URL="https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta/Realm.xcframework.zip"
REALMSWIFT_URL="https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta/RealmSwift.xcframework.zip"
REALM_CHECKSUM="a1b2c3d4e5f6789abcdef0123456789abcdef0123456789abcdef0123456789ab"
REALMSWIFT_CHECKSUM="9f8e7d6c5b4a321fedcba9876543210fedcba9876543210fedcba9876543210f"

echo "=== Testing with NEW manifest (placeholders) ==="
# Create new manifest from template
cp templates/Package.swift.template test_new.swift
sed -i '' 's/SWIFT_VERSION_PLACEHOLDER/6.2/g' test_new.swift
sed -i '' "s|REALM_URL_PLACEHOLDER|https://example.com/placeholder/Realm.xcframework.zip|g" test_new.swift
sed -i '' "s|REALMSWIFT_URL_PLACEHOLDER|https://example.com/placeholder/RealmSwift.xcframework.zip|g" test_new.swift
sed -i '' "s|REALM_CHECKSUM_PLACEHOLDER|placeholder-realm-checksum|g" test_new.swift
sed -i '' "s|REALMSWIFT_CHECKSUM_PLACEHOLDER|placeholder-realmswift-checksum|g" test_new.swift

MANIFEST_FILE="test_new.swift"

# Apply the exact workflow logic
sed -i '' "s|url: \"[^\"]*Realm\.xcframework\.zip\"|url: \"$REALM_URL\"|g" "$MANIFEST_FILE"
sed -i '' "s|url: \"[^\"]*RealmSwift\.xcframework\.zip\"|url: \"$REALMSWIFT_URL\"|g" "$MANIFEST_FILE"

# Update checksums - handle both new manifests (with placeholders) and existing manifests
sed -i '' "s|checksum: \"placeholder-realm-checksum\"|checksum: \"$REALM_CHECKSUM\"|g" "$MANIFEST_FILE"
sed -i '' "s|checksum: \"placeholder-realmswift-checksum\"|checksum: \"$REALMSWIFT_CHECKSUM\"|g" "$MANIFEST_FILE"

# For existing manifests, replace any checksum that follows a Realm URL (range-based replacement)
sed -i '' "/url:.*Realm\.xcframework\.zip/,/checksum:/ s|checksum: \"[^\"]*\"|checksum: \"$REALM_CHECKSUM\"|" "$MANIFEST_FILE"
sed -i '' "/url:.*RealmSwift\.xcframework\.zip/,/checksum:/ s|checksum: \"[^\"]*\"|checksum: \"$REALMSWIFT_CHECKSUM\"|" "$MANIFEST_FILE"

echo "✅ New manifest result:"
echo "----------------------------------------"
cat test_new.swift
echo "----------------------------------------"

echo "=== Testing with EXISTING manifest (real checksums) ==="
# Copy existing manifest
cp Package@swift-6.2.swift test_existing.swift

MANIFEST_FILE="test_existing.swift"

# Apply the exact workflow logic
sed -i '' "s|url: \"[^\"]*Realm\.xcframework\.zip\"|url: \"$REALM_URL\"|g" "$MANIFEST_FILE"
sed -i '' "s|url: \"[^\"]*RealmSwift\.xcframework\.zip\"|url: \"$REALMSWIFT_URL\"|g" "$MANIFEST_FILE"

# Update checksums - handle both new manifests (with placeholders) and existing manifests
sed -i '' "s|checksum: \"placeholder-realm-checksum\"|checksum: \"$REALM_CHECKSUM\"|g" "$MANIFEST_FILE"
sed -i '' "s|checksum: \"placeholder-realmswift-checksum\"|checksum: \"$REALMSWIFT_CHECKSUM\"|g" "$MANIFEST_FILE"

# For existing manifests, replace any checksum that follows a Realm URL (range-based replacement)
sed -i '' "/url:.*Realm\.xcframework\.zip/,/checksum:/ s|checksum: \"[^\"]*\"|checksum: \"$REALM_CHECKSUM\"|" "$MANIFEST_FILE"
sed -i '' "/url:.*RealmSwift\.xcframework\.zip/,/checksum:/ s|checksum: \"[^\"]*\"|checksum: \"$REALMSWIFT_CHECKSUM\"|" "$MANIFEST_FILE"

echo "✅ Existing manifest result:"
echo "----------------------------------------"
cat test_existing.swift
echo "----------------------------------------"

# Validation
echo "🔍 Final validation:"

# Check new manifest
if grep -q "$REALM_CHECKSUM" test_new.swift && grep -q "$REALMSWIFT_CHECKSUM" test_new.swift; then
    echo "✅ New manifest checksums updated correctly"
else
    echo "❌ New manifest checksums not updated"
fi

# Check existing manifest
if grep -q "$REALM_CHECKSUM" test_existing.swift && grep -q "$REALMSWIFT_CHECKSUM" test_existing.swift; then
    echo "✅ Existing manifest checksums updated correctly"
else
    echo "❌ Existing manifest checksums not updated"
fi

# Check URLs
if grep -q "$REALM_URL" test_existing.swift && grep -q "$REALMSWIFT_URL" test_existing.swift; then
    echo "✅ URLs updated correctly in existing manifest"
else
    echo "❌ URLs not updated in existing manifest"
fi

# Cleanup
rm -f test_new.swift test_existing.swift

echo "🎉 Workflow logic test completed!"