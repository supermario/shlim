module ShlimSpec where

import Test.Hspec
import Shlim

spec :: Spec
spec = do
  describe "parseLine" $ do
    it "wraps tags" $ do
      parseLine ["div", "content"] `shouldBe` "<div>content</div>"

    it "wraps tags" $ do
      parseLine ["div.test", "content"] `shouldBe` "<div class='test'>content</div>"
