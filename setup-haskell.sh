ARCH=i386
DOWNLOADS=$HOME/Downloads
PREFIX=/usr/local/ghc-7.8.2
BUILD=/tmp/

export PATH=$PREFIX/bin:$PATH

sudo mkdir -p $PREFIX

(cd $DOWNLOADS && wget http://www.haskell.org/ghc/dist/7.8.2/ghc-7.8.2-src.tar.bz2)
(cd $BUILD && tar -xjf $DOWNLOADS/ghc-7.8.2-src.tar.bz2)
(cd $BUILD/ghc-7.8.2 && ./configure --prefix $PREFIX)
(cd $BUILD/ghc-7.8.2 && make)
(cd $BUILD/ghc-7.8.2 && sudo make install)

GHC=`which ghc`
RUNGHC=`which runghc`

fromHackage() {
(cd $DOWNLOADS && wget https://hackage.haskell.org/package/$1-$2/$1-$2.tar.gz)
(cd $BUILD && tar -xzf $DOWNLOADS/$1-$2.tar.gz)
(cd $BUILD/$1-$2 && $RUNGHC $3 configure --global --prefix $PREFIX)
(cd $BUILD/$1-$2 && $RUNGHC $3 build)
(cd $BUILD/$1-$2 && sudo $RUNGHC $3 install)
}

fromHackage zlib 0.5.4.1 Setup.hs
fromHackage stm 2.4.3 Setup.hs
fromHackage random 1.0.1.1 Setup.hs
fromHackage mtl 2.1.3.1 Setup.hs
fromHackage text 1.1.1.3 Setup.lhs
fromHackage parsec 3.1.5 Setup.hs
fromHackage network 2.5.0.0 Setup.hs
fromHackage HTTP 4000.2.17 Setup.lhs
fromHackage cabal-install 1.18.0.5 Setup.hs

# Not even sure I want alex and happy installed globally, but it seems
# that cabal 1.18 can't build them:
#
# https://github.com/haskell/cabal/issues/1777#
#
# So we'll install them and their dependencies globally so we don'y
# have to keep dealing with this
#
sudo cabal install --global --dependencies-only happy alex
sudo cabal install --global happy alex

