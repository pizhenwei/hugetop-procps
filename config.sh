grep -E "^#define HAVE" procps/config.h | awk '{print "-D"$2}' | tr "\n" " "
