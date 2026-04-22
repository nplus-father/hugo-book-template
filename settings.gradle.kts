pluginManagement {
    repositories {
        maven {
            url = uri("https://maven.pkg.github.com/nplus-father/book-gradle-conventions")
            credentials {
                username = System.getenv("GITHUB_ACTOR") ?: "nplus-father"
                password = System.getenv("GITHUB_TOKEN") ?: System.getenv("GH_TOKEN") ?: ""
            }
        }
        gradlePluginPortal()
    }
}

rootProject.name = "hugo-book-template"
