package com.tgame.shell.view.components.ynSpecial
{
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.Label;
   import game.display.SimpleButton;
   import game.skin.zhouqicailuSkin;
   import game.utils.SkinTools;
   
   public class YN2016ZhouqicailuPanel extends BasePanel
   {
      
      public static const LINGQUJIANGLI:String = "LINGQUJIANGLI";
      
      private var btn1:SimpleButton;
      
      private var btn2:SimpleButton;
      
      private var btn3:SimpleButton;
      
      private var btn4:SimpleButton;
      
      private var btn5:SimpleButton;
      
      private var btn6:SimpleButton;
      
      private var btn7:SimpleButton;
      
      private var timeLabel:Label;
      
      private var yuanbaoLabel:Label;
      
      private var goodsnum1:Label;
      
      private var goodsnum2:Label;
      
      private var goodsnum3:Label;
      
      private var goodsnum4:Label;
      
      private var goodsnum5:Label;
      
      private var goodsnum6:Label;
      
      private var goodsnum7:Label;
      
      private var _container:Container;
      
      private var guanbi:SimpleButton;
      
      public function YN2016ZhouqicailuPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(zhouqicailuSkin.skin,"zhouqicailu");
      }
      
      override protected function createVariableReference() : void
      {
         this.btn1 = getChildByName("lingquanniu1") as SimpleButton;
         this.btn2 = getChildByName("lingquanniu2") as SimpleButton;
         this.btn3 = getChildByName("lingquanniu3") as SimpleButton;
         this.btn4 = getChildByName("lingquanniu4") as SimpleButton;
         this.btn5 = getChildByName("lingquanniu5") as SimpleButton;
         this.btn6 = getChildByName("lingquanniu6") as SimpleButton;
         this.btn7 = getChildByName("lingquanniu7") as SimpleButton;
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.timeLabel = getChildByName("wenben2") as Label;
         this.yuanbaoLabel = getChildByName("wenben4") as Label;
         this.goodsnum1 = getChildByName("wenben5") as Label;
         this.goodsnum2 = getChildByName("wenben6") as Label;
         this.goodsnum3 = getChildByName("wenben7") as Label;
         this.goodsnum4 = getChildByName("wenben8") as Label;
         this.goodsnum5 = getChildByName("wenben9") as Label;
         this.goodsnum6 = getChildByName("wenben10") as Label;
         this.goodsnum7 = getChildByName("wenben1") as Label;
         this.btn1.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn3.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn4.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn5.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn6.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn7.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
         this._container = new Container();
         addChild(this._container);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:SimpleButton = param1.target as SimpleButton;
         if(_loc2_.enabled)
         {
            dispatchEvent(new BaseEvent(YN2016ZhouqicailuPanel.LINGQUJIANGLI,"",_loc2_.name));
         }
      }
      
      public function setData(param1:Object) : void
      {
         var _loc4_:ItemFace = null;
         while(this._container.numChildren > 0)
         {
            this._container.removeChildAt(0);
         }
         var _loc2_:Array = param1.arr;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = new ItemFace(new Goods(_loc2_[_loc3_].id));
            this._container.addChild(_loc4_);
            _loc4_.x = 32 + _loc3_ * 76;
            _loc4_.y = 178;
            this["goodsnum" + String(_loc3_ + 1)].text = "SL:" + _loc2_[_loc3_].count;
            if(_loc2_[_loc3_].enabled == 1)
            {
               this["btn" + String(_loc3_ + 1)].enabled = true;
            }
            else
            {
               this["btn" + String(_loc3_ + 1)].enabled = false;
            }
            this["btn" + String(_loc3_ + 1)].name = _loc2_[_loc3_].name;
            _loc3_++;
         }
         this.timeLabel.text = param1.time;
         this.yuanbaoLabel.text = param1.yuanbao;
      }
   }
}

