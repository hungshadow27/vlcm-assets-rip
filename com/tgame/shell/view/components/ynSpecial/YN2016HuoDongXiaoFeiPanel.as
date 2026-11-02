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
   import game.skin.huodongxiaofeiSkin;
   import game.utils.SkinTools;
   
   public class YN2016HuoDongXiaoFeiPanel extends BasePanel
   {
      
      public static const HUODONGXIAOFEI_LINGQU:String = "HUODONGXIAOFEI_LINGQU";
      
      public static const WUSHEN_LINGQU:String = "WUSHEN_LINGQU";
      
      public static const WUSHEN_TIJIAO:String = "WUSHEN_TIJIAO";
      
      public static const WUSHEN_FANYE:String = "WUSHEN_FANYE";
      
      private var guanbi:SimpleButton;
      
      private var btnLingQu1:Button;
      
      private var btnLingQu2:Button;
      
      private var btnLingQu3:Button;
      
      private var btnLingQu4:Button;
      
      private var btnLingQu5:Button;
      
      private var btnLingQu6:Button;
      
      private var btnLingQu7:Button;
      
      private var btnLingQu8:Button;
      
      private var btnLingQu9:Button;
      
      private var btnLingQu10:Button;
      
      private var btnLingQu11:Button;
      
      private var btnLingQu12:Button;
      
      private var xxx:Label;
      
      private var yyy:Label;
      
      private var yyyy:Label;
      
      private var xxxx:Label;
      
      private var boxContainer:Sprite;
      
      private var arr:Array = [40289,43189,725245,725248,9320,41726];
      
      public function YN2016HuoDongXiaoFeiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(huodongxiaofeiSkin.skin,"xiaofeijiemian");
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
         this.btnLingQu3 = getChildByName("lingqu3") as Button;
         this.btnLingQu3.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu4 = getChildByName("lingqu4") as Button;
         this.btnLingQu4.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu5 = getChildByName("lingqu5") as Button;
         this.btnLingQu5.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu6 = getChildByName("lingqu6") as Button;
         this.btnLingQu6.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu7 = getChildByName("lingqu7") as Button;
         this.btnLingQu7.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu8 = getChildByName("lingqu8") as Button;
         this.btnLingQu8.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu9 = getChildByName("lingqu9") as Button;
         this.btnLingQu9.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu10 = getChildByName("lingqu10") as Button;
         this.btnLingQu10.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu11 = getChildByName("lingqu11") as Button;
         this.btnLingQu11.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu12 = getChildByName("lingqu12") as Button;
         this.btnLingQu12.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.xxx = getChildByName("wenben4") as Label;
         this.yyy = getChildByName("wenben8") as Label;
         this.xxxx = getChildByName("wenben6") as Label;
         this.yyyy = getChildByName("wenben10") as Label;
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.btnLingQu1:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":1,
                  "index":1
               }));
               break;
            case this.btnLingQu2:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":2,
                  "index":1
               }));
               break;
            case this.btnLingQu3:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":1,
                  "index":2
               }));
               break;
            case this.btnLingQu4:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":2,
                  "index":2
               }));
               break;
            case this.btnLingQu5:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":1,
                  "index":3
               }));
               break;
            case this.btnLingQu6:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":2,
                  "index":3
               }));
               break;
            case this.btnLingQu11:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":1,
                  "index":4
               }));
               break;
            case this.btnLingQu12:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":2,
                  "index":4
               }));
               break;
            case this.btnLingQu7:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":1,
                  "index":5
               }));
               break;
            case this.btnLingQu8:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":2,
                  "index":5
               }));
               break;
            case this.btnLingQu9:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":1,
                  "index":6
               }));
               break;
            case this.btnLingQu10:
               dispatchEvent(new BaseEvent(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,"",{
                  "type":2,
                  "index":6
               }));
         }
      }
      
      public function setHuoDongXiaoFeiData(param1:Object) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         this.removeBoxContainer();
         this.xxx.htmlText = param1.xxx + "";
         this.yyy.htmlText = param1.yyy + "";
         this.yyyy.htmlText = param1.yyyy + "";
         this.xxxx.htmlText = param1.xxxx + "";
         var _loc2_:int = 0;
         while(_loc2_ < this.arr.length)
         {
            _loc3_ = new Goods(this.arr[_loc2_]);
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.x = 189;
            _loc4_.y = _loc2_ * 53 + 230;
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

