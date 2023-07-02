if [ ! "$COMPOSER_ENTRYPOINT_SCRIPT" = false ] && [ ! -f "$APP/vendor/autoload.php" ]; then
  composer -n -d "$APP" ${COMPOSER_ENTRYPOINT_SCRIPT:-install}
fi
