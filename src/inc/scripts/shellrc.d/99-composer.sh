# add local vendor bin
PATH="$PATH:$(composer config -d "$APP" bin-dir --absolute 2>/dev/null)"

# add global vendor bin (added in ZSH by composer plugin)
if [ -z "${ZSH_VERSION}" ]; then
  PATH="$PATH:$(composer global config bin-dir --absolute 2>/dev/null)"
fi
