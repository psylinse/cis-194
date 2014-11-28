module Homework4 where

fun1 :: [Integer] -> Integer
fun1 [] = 1
fun1 (x:xs)
  | even x = (x - 2) * fun1 xs
  | otherwise = fun1 xs

fun1' :: [Integer] -> Integer
fun1' = product . (map go) . filter even 
  where go x =  x - 2


fun2 :: Integer -> Integer
fun2 1 = 0
fun2 n
  | even n    = n + fun2 (n `div` 2)
  | otherwise = fun2 (3 * n + 1)


fun2' :: Integer -> Integer
fun2' n
  | even n    = sum . takeWhile (>1) . iterate (`div` 2) $ n 
  | otherwise = fun2 $ 3 * n + 1


data Tree a = Leaf
            | Node Integer (Tree a) a (Tree a)

            deriving (Show, Eq)

foldTree :: [a] -> Tree a
foldTree = undefined

checkTree :: Bool
checkTree = foldTree "ABCDEFGHIJ" ==
            Node 3
            (Node 2
             (Node 0 Leaf 'F' Leaf)
             'I'
             (Node 1 (Node 0 Leaf 'B' Leaf) 'C' Leaf))
            'J'
            (Node 2
             (Node 1 (Node 0 Leaf 'A' Leaf) 'G' Leaf)
             'H'
             (Node 1 (Node 0 Leaf 'D' Leaf) 'E' Leaf))



main :: IO ()
main = do
  putStrLn $ (show . fun1) [1, 3, 4, 32, 13, 32, 103]
  putStrLn $ (show . fun1') [1, 3, 4, 32, 13, 32, 103]

  putStrLn $ (show . fun2) 4
  putStrLn $ (show . fun2') 4

  putStrLn $ (show . fun2) 5
  putStrLn $ (show . fun2') 5

  putStrLn $ (show . fun2) 7
  putStrLn $ (show . fun2') 7

  putStrLn $ show checkTree
