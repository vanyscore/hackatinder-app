# shellcheck disable=SC2164
cd ./fl_app/
flutter build web --web-renderer canvaskit
cd ../npm
npm run server-start || exit 1