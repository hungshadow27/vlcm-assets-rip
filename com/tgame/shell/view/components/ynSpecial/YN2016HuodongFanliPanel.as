package com.tgame.shell.view.components.ynSpecial
{
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.display.Button;
   import game.display.Label;
   import game.display.SimpleButton;
   import game.skin.fanli2Skin;
   import game.utils.SkinTools;
   
   public class YN2016HuodongFanliPanel extends BasePanel
   {
      
      public static const HUODONGFANEL_LINGQU:String = "HUODONGFANEL_LINGQU";
      
      private var guanbi:SimpleButton;
      
      private var btnLingQu1:Button;
      
      private var btnLingQu2:Button;
      
      private var yuanbao:Label;
      
      private var jinpiao:Label;
      
      private var zonghe:Label;
      
      private var num:Label;
      
      private var boxContainer:Sprite;
      
      private var arr:Array = [712744];
      
      public function YN2016HuodongFanliPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(fanli2Skin.skin,"fanli");
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
      }
      
      override protected function createVariableReference() : void
      {
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.gotoClose);
         this.btnLingQu1 = getChildByName("lingqu1") as Button;
         this.btnLingQu1.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu2 = getChildByName("lingqu2") as Button;
         this.btnLingQu2.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.yuanbao = getChildByName("szi2") as Label;
         this.jinpiao = getChildByName("szi6") as Label;
         this.zonghe = getChildByName("szi4") as Label;
         this.num = getChildByName("szi8") as Label;
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.btnLingQu1:
               dispatchEvent(new BaseEvent(HUODONGFANEL_LINGQU,"",{"type":1}));
               break;
            case this.btnLingQu2:
               dispatchEvent(new BaseEvent(HUODONGFANEL_LINGQU,"",{"type":2}));
         }
      }
      
      public function setHuoDongFanliData(param1:Object) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         this.removeBoxContainer();
         this.yuanbao.htmlText = param1.yuanbao + "";
         this.jinpiao.htmlText = param1.jinpiao + "";
         this.zonghe.htmlText = param1.xiaoyuanbao + "+" + param1.xiaojianpiao;
         this.num.htmlText = param1.yuanbaolingjiangcishu + "+" + param1.jinpiaolingjiangcishu;
         var _loc2_:int = 0;
         while(_loc2_ < this.arr.length)
         {
            _loc3_ = new Goods(this.arr[_loc2_]);
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.x = 193;
            _loc4_.y = _loc2_ * 53 + 308;
            this.boxContainer.addChild(_loc4_);
            _loc2_++;
         }
      }
      
      private function removeBoxContainer() : void
      {
         while(this.boxContainer.numChildren)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
      
      private function gotoClose(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

