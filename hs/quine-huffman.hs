import Data.List (foldl')

data HuffTree a = Leaf a | Node (HuffTree a) (HuffTree a)
                deriving (Show, Eq)

deserialize :: String -> HuffTree Char
deserialize = fst . subdeserialize
  where
    subdeserialize (apex : rest)
      | apex == escChar = case rest of
        [] -> undefined
        (c : rest') -> (Leaf c, rest')
      | apex == nodeMark = let (a, rest') = subdeserialize rest
                               (b, rest'') = subdeserialize rest'
                           in (Node a b, rest'')
      | otherwise = (Leaf apex, rest)
    nodeMark = '#'
    escChar = '\\'

huffDecode :: Ord a => HuffTree a -> Integer -> [a]
huffDecode tree code = reverse $
                       if treeRem == tree
                       then result else resolveZero treeRem : result
  where
    (treeRem, result) = foldl' addBit (tree, []) bits
    resolveZero subtree = case subtree of
      Leaf v -> v
      Node subtree' _ -> resolveZero subtree'
    addBit (Node left right, acc) bit = let
      newTree = if bit == 0 then left else right
      in case newTree of
          Node {} -> (newTree, acc)
          Leaf v -> (tree, v : acc)
    bits = map (`mod` 2) $ takeWhile (>0) $ iterate (`div` 2) code

huffTree :: HuffTree Char
huffTree = deserialize "#####i\n###-v(2##s#)n#a##,#.Nl ########+B#MOT3t##=o#u9####:>#b#HL#5##gp#z#IR#####Z[#\\\\]'1#6d####8###k#EWm#w##_{$r#\\###c##CD#S`f#e#####qx#|#}\"h0#47"

quine :: Integer -> String
quine = (. show) . (++) . huffDecode huffTree >>= id

main :: IO ()
main = putStrLn $
  quine 4031058446863947415713346167013470316421942103225922099047414534542766833179408737335033038875708217050831680071658052594850838806699337617275075289106943463085166012473214130186285676505264981428198615926774267791995926976062284227534253094126070471039000501171484842205210831205993856822736793099584041744333416238470769111527788585324442330363799805953329042759481017749662474276136786680969300720768222137640932816097222630001173414718602876852559913690848236491217004392625179352675018043790620822764353227788662547013797954972707798439667350079911088043537202959361219271131683453945267993180247789110348166048677051303200295482610214557810062710479300531327548579608624376799378702462318517776403495492794432318980149874557491050977576416053540052132853251439947414278933639301352407487925290900350611783941714350360788573555445198367032356666125832493913199424374799765895720205110891732350368755374286305914402322143203733063041219480523265491667161705479478387004523150115709170596945833501081128903667929853395612102971432072913542779765406292770840779116101664437502276288267643157589481759547185619805727021762335252299449896890168825280126663270676187573044800441187259752120603457771028063112174730265009021122079338311898922834926162447792482539332926652311873631252794024683454986722217951002572307567503207928521477561252368402678568870633580865632263766646835080281253465725529177023287122146388186486975565248451779730423268893882318660153818015662925246540057593419626257828219692404977982589764460536538437849159042661584455727079895685448865525072477018500990090573539059115364629143804267193507977204838151210550970471421375325673342158076888724976639343405644378748708154335751006909949850443149480517184152377006034291139775560458136162816690459484542744347453162361028828473355642594084234652598806361331715572766678969828149868148983367020120372339481418866837729237031668603729739042720478061948311399886387987950617295897214647300910176929810996439187120662953348794553069332183567667102402036869663998012049449064226366156791282488889658656646324255465190465143377062768098236727483140096215510594396115803433756469789490568937378280794488275347971768454840131360290569839463637293639396647533158134518931446345511277605984