# Share Hub: Home Page

Share Hub Home Page is a redesigned view for the Home Page of the Share Hub Mobile App. This project is built using Flutter and provides a modern and user-friendly interface for users to interact with the Share Hub platform.

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
