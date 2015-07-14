module ShlimSpec where

import Test.Hspec
import Shlim

spec :: Spec
spec = do
  describe "tag" $ do
    it "wraps tags" $ do
      tag ["div", "test"] `shouldBe` "<div>test</div>"
