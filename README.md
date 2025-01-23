# Share Hub: Home Page

Share Hub Home Page is a redesigned view for the Home Page of the Share Hub Mobile App. This project is built using Flutter and provides a modern and user-friendly interface for users to interact with the Share Hub platform.

## Figma Design Link
[Figma Design Link](https://www.figma.com/design/2MBf6mgQPDjUMZayHt9zib/Share-Hub?node-id=0-1&t=N16B6C8laOx4WPjl-1)

## Features

- **Graph**: Line Graph about the market. The data is fetched every 10 second and the data is updated. It is stored locally as well using `get_storage`.
- **Watch List**: View the top gainers in the market with detailed information and graphical representation.
- **Market Summary**: Get a quick summary of the market with key metrics.
- **Profile Card**: Display user profile information with a customizable card.
- **Market Dashboard**: View detailed market data including top gainers, top losers, top turnover, top transactions, and top traded shares.
- **Floating Navigation**: A floating navigation bar for quick access to different sections of the app.
- **Dark Mode**: Availability of Dark Mode toggled with one tap.

## Instructions to Run

To get started with the project, follow these steps:

1. **Clone the repository**:
    ```sh
    git clone https://github.com/gaurovgiri/sharehub-home.git
    ```
2. **Navigate to the project directory**:
    ```sh
    cd sharehub_home
    ```
3. **Install dependencies**:
    ```sh
    flutter pub get
    ```
4. **Run the app**:
    ```sh
    flutter run
    ```


## Demo

https://github.com/user-attachments/assets/b75bef70-8bba-42c4-a553-9235ce805c5b

## Folder Structure
```bash
lib
├── main.dart
├── model
│   ├── graph_model.dart
│   ├── market_model.dart
│   └── watchlist_model.dart
├── repo
│   ├── graph_repo.dart
│   └── market_repo.dart
├── resources
│   └── app_theme.dart
├── viewmodel
│   ├── graph_view_model.dart
│   ├── main_screen_view_model.dart
│   ├── market_dashboard_view_model.dart
│   └── theme_view_model.dart
└── views
    ├── main_screen_view.dart
    ├── pages
    │   └── home_page.dart
    ├── splash_screen.dart
    └── widgets
        ├── floating_nav.dart
        ├── graph.dart
        ├── labels.dart
        ├── market_dashboard.dart
        ├── market_dashboard_two.dart
        ├── market_summary.dart
        ├── profile_card.dart
        └── watch_list.dart

```

## Dependencies

The project uses the following dependencies:

- `flutter`
- `get`
- `get_storage`
- `dio`
- `fl_chart`
- `intl`
- `carousel_slider`
- `cupertino_icons`
