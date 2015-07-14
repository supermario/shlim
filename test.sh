set -e
set -x

ghc --make shlim

./shlim < test.slim
