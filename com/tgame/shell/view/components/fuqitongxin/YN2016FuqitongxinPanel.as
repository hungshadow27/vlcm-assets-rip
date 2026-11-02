package com.tgame.shell.view.components.fuqitongxin
{
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.display.Label;
   import game.display.SimpleButton;
   import game.skin.FuQiTongXinSkin;
   import game.utils.SkinTools;
   
   public class YN2016FuqitongxinPanel extends BasePanel
   {
      
      private var guanbi:SimpleButton;
      
      private var btn1:SimpleButton;
      
      private var btn2:SimpleButton;
      
      private var btn3:SimpleButton;
      
      private var btn4:SimpleButton;
      
      private var paihangbang:SimpleButton;
      
      private var label:Label;
      
      private var boxContainer:Sprite;
      
      private var arr:Array = [[{"id":726258},{"id":41947}],[{"id":726258},{"id":42351}],[{"id":726258},{"id":42352}],[{"id":726258},{"id":42353}]];
      
      public function YN2016FuqitongxinPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(FuQiTongXinSkin.skin,"fuqitingxin");
      }
      
      override protected function createVariableReference() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
         this.btn1 = getChildByName("lingquanniu1") as SimpleButton;
         this.btn1.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.btn2 = getChildByName("lingquanniu2") as SimpleButton;
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.btn3 = getChildByName("lingquanniu3") as SimpleButton;
         this.btn3.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.btn4 = getChildByName("lingquanniu4") as SimpleButton;
         this.btn4.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         var _loc1_:int = 0;
         while(_loc1_ < this.arr.length)
         {
            _loc2_ = 0;
            while(_loc2_ < this.arr[_loc1_].length)
            {
               _loc3_ = new Goods(this.arr[_loc1_][_loc2_].id);
               _loc4_ = new ItemFace(_loc3_);
               _loc4_.x = _loc2_ * 155 + 34;
               _loc4_.y = _loc1_ * 47 + 132;
               this.boxContainer.addChild(_loc4_);
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      protected function clickfunction(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               dispatchEvent(new BaseEvent(YN2016FuqitongxinPaihangbangPanel.DUIHUANWUPIN,"",1));
               break;
            case this.btn2:
               dispatchEvent(new BaseEvent(YN2016FuqitongxinPaihangbangPanel.DUIHUANWUPIN,"",2));
               break;
            case this.btn3:
               dispatchEvent(new BaseEvent(YN2016FuqitongxinPaihangbangPanel.DUIHUANWUPIN,"",3));
               break;
            case this.btn4:
               dispatchEvent(new BaseEvent(YN2016FuqitongxinPaihangbangPanel.DUIHUANWUPIN,"",4));
               break;
            case this.paihangbang:
               dispatchEvent(new BaseEvent(YN2016FuqitongxinPaihangbangPanel.PAIHANGBANG));
         }
      }
      
      public function setData(param1:Object) : void
      {
         this.label.text = param1.shuliang + "";
      }
   }
}

