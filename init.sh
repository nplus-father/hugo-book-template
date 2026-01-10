#!/bin/bash

OLD_SLUG="hugo-book-template"     # 對應 go.mod, 網址, 檔案路徑
OLD_EN_TITLE="Hugo Book Template" # 對應 README 英文標題
OLD_ZH_TITLE="讀書筆記模版"       # 對應 hugo.toml 網站標題

echo "📘 準備初始化新的讀書筆記專案..."
echo "------------------------------------------"

read -r -p "1. 請輸入新書的 [英文代號 Slug] (例如: atomic-habits): " NEW_SLUG
read -r -p "2. 請輸入新書的 [英文書名] (例如: Atomic Habits): " NEW_EN_TITLE
read -r -p "3. 請輸入新書的 [中文書名] (例如: 原子習慣): " NEW_ZH_TITLE

echo "------------------------------------------"
echo "🔄 正在執行替換作業..."

# 3. 執行替換 (使用 | 作為分隔符，避免與網址中的 / 衝突)
# ------------------------------------------

replace_text() {
    local file=$1
    local old=$2
    local new=$3

    if [ -f "$file" ]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s|$old|$new|g" "$file"
        else
            sed -i "s|$old|$new|g" "$file"
        fi
        echo "  ✅ 已更新 $file: '$old' -> '$new'"
    else
        echo "  ⚠️ 跳過 $file (找不到檔案)"
    fi
}

replace_text "README.md" "$OLD_SLUG" "$NEW_SLUG"
replace_text "README.md" "$OLD_EN_TITLE" "$NEW_EN_TITLE"
replace_text "README.md" "$OLD_ZH_TITLE" "$NEW_ZH_TITLE"

CONFIG_FILE="site/hugo.toml"
replace_text "$CONFIG_FILE" "$OLD_ZH_TITLE" "$NEW_ZH_TITLE"
replace_text "$CONFIG_FILE" "$OLD_SLUG" "$NEW_SLUG"

INDEX_FILE="site/content/_index.md"
replace_text "$INDEX_FILE" "$OLD_ZH_TITLE" "$NEW_ZH_TITLE"

cd site
go mod edit -module github.com/andrewnplus/$NEW_SLUG
cd ..
echo "  ✅ 已更新 site/go.mod Module 名稱"

replace_text "settings.gradle.kts" "$OLD_SLUG" "$NEW_SLUG"

echo "------------------------------------------"
echo "🎉 初始化完成！"
echo "新專案: $NEW_ZH_TITLE ($NEW_EN_TITLE)"
echo "請執行: ./gradlew hugoServer 進行測試"