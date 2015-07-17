module ShlimSpec where

import Test.Hspec
import Shlim

spec :: Spec
spec = do
  describe "parseLine" $ do
    it "wraps tags" $ do
      parseLine ["div", "content"]       `shouldBe` "<div>content</div>"

    it "handles .classes" $ do
      parseLine [".test", "content"]     `shouldBe` "<div class='test'>content</div>"

    it "handles #ids" $ do
      parseLine ["#test", "content"]     `shouldBe` "<div id='test'>content</div>"

    it "handles #ids.classes" $ do
      parseLine ["#test.ing", "content"] `shouldBe` "<div id='test' class='ing'>content</div>"
