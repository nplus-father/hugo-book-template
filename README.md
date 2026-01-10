# Hugo Book Template

<p align="center">
  <img src="site/content/cover.png" width="250" height="250" alt="Book Cover">
</p>

> [!NOTE]
> 這是 **讀書筆記模版** 的專案倉庫。

## 📖 Introduction

Welcome to the digital summary for **Hugo Book Template**. 
This project is designed to provide a seamless, high-performance reading experience across all devices.

## 🛠️ Technology Stack

* **Hugo** – Ultra-fast static site generation.
* **nplus-book-core** – Centralized design system and theme extensions.
* **hugo-book** – Base theme optimized for structured technical content.
* **Gradle Wrapper** – Orchestrates build tasks and Hugo commands.
* **Goldmark** – Native Markdown rendering with custom attribute support.

## 🚀 Local Setup & Development

These steps require **JDK 17+** to be installed on your system:

### 1. Clone the Repository
```bash
git clone git@github.com:Andrewnplus/hugo-book-template.git
cd hugo-book-template
```

### 2. Launch Development Server
```bash
./gradlew hugoServer
```
* **Preview**: Access http://localhost:1313 in your browser.
* **Live Reload**: The site will automatically refresh as you save changes to Markdown files or assets.

### 3. Build & Production
The CI/CD pipeline is handled automatically via GitHub Actions upon pushing to the `main` branch.

---
© Nplus