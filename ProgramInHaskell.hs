{- |
Module      : ProgramInHaskell
Description : Haskellによるプログラム
Copyright   :
License     : GPL-3
Maintiner   :
Staibility  : experimental
Portability :
-}

module ProgramInHaskell (
  primeNumbers,
  main
) where

-- | 最初の素数
firstPrime :: Int
firstPrime = 2

-- | エラトステネスの篩(ふるい)により最大値mまでの素数のリストを取得する。
--   mが整数でない場合、コンパイルエラーとなる。
primeNumbers :: Int -> [Int]
primeNumbers m = primeFilter numbers primes stopPoint
  where
    numbers   = [firstPrime..m]
    primes    = []
    stopPoint = floor . sqrt $ (fromIntegral m :: Double)

-- | 整数のリストnumbersを停止点stopPointまでで素数としてフィルタリングしたリストを返却する。
primeFilter :: [Int] -> [Int] -> Int -> [Int]
primeFilter [] _ _ = []
primeFilter numbers@(n:ns) primes stopPoint
  | n > stopPoint = reverse primes ++ numbers
  | otherwise     = primeFilter [x | x <- ns, x `mod` n /= 0] (n : primes) stopPoint

-- 実行例
main :: IO ()
main = print $ primeNumbers 100
