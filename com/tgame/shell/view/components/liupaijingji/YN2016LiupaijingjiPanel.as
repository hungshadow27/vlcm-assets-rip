package com.tgame.shell.view.components.liupaijingji
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.Label;
   import game.display.SimpleButton;
   import game.skin.LiuPaiJingJi20170215Skin;
   import game.utils.SkinTools;
   
   public class YN2016LiupaijingjiPanel extends BasePanel
   {
      
      public static const LINGQUJIANGLI:String = "LIUPAIJINGJILINGQUJIANGLI";
      
      public static const TIJIAOWUPIN:String = "LIUPAIJINGJITIJIAOWUPIN";
      
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
      
      public function YN2016LiupaijingjiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(LiuPaiJingJi20170215Skin.skin,"liupaijingji");
      }
      
      override protected function createVariableReference() : void
      {
         this.btn1 = getChildByName("tijiaoanniu1") as SimpleButton;
         this.btn2 = getChildByName("tijiaoanniu2") as SimpleButton;
         this.btn3 = getChildByName("tijiaoanniu3") as SimpleButton;
         this.btn4 = getChildByName("tijiaoanniu4") as SimpleButton;
         this.btn5 = getChildByName("tijiaoanniu5") as SimpleButton;
         this.btn6 = getChildByName("tijiaoanniu6") as SimpleButton;
         this.btn7 = getChildByName("lingquanniu") as SimpleButton;
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.goodsnum1 = getChildByName("wenben1") as Label;
         this.goodsnum2 = getChildByName("wenben2") as Label;
         this.goodsnum3 = getChildByName("wenben3") as Label;
         this.goodsnum4 = getChildByName("wenben4") as Label;
         this.goodsnum5 = getChildByName("wenben5") as Label;
         this.goodsnum6 = getChildByName("wenben6") as Label;
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
         switch(param1.target)
         {
            case this.btn1:
            case this.btn2:
            case this.btn3:
            case this.btn4:
            case this.btn5:
            case this.btn6:
               if(_loc2_.enabled)
               {
                  dispatchEvent(new BaseEvent(YN2016LiupaijingjiPanel.TIJIAOWUPIN));
               }
               break;
            case this.btn7:
               if(_loc2_.enabled)
               {
                  dispatchEvent(new BaseEvent(YN2016LiupaijingjiPanel.LINGQUJIANGLI));
               }
         }
      }
      
      public function setData(param1:Array) : void
      {
         this.goodsnum1.text = param1[0];
         this.goodsnum2.text = param1[1];
         this.goodsnum3.text = param1[2];
         this.goodsnum4.text = param1[3];
         this.goodsnum5.text = param1[4];
         this.goodsnum6.text = param1[5];
         this.btn7.enabled = param1[6];
         var _loc2_:int = 1;
         while(_loc2_ <= 6)
         {
            this["btn" + _loc2_].enabled = false;
            _loc2_++;
         }
         if(GameInstance.mainCharData.attributeInfo.partyID == 1)
         {
            this.btn1.enabled = true;
         }
         else if(GameInstance.mainCharData.attributeInfo.partyID == 2)
         {
            this.btn2.enabled = true;
         }
         else if(GameInstance.mainCharData.attributeInfo.partyID == 4)
         {
            this.btn3.enabled = true;
         }
         else if(GameInstance.mainCharData.attributeInfo.partyID == 3)
         {
            this.btn4.enabled = true;
         }
         else if(GameInstance.mainCharData.attributeInfo.partyID == 6)
         {
            this.btn5.enabled = true;
         }
         else if(GameInstance.mainCharData.attributeInfo.partyID == 5)
         {
            this.btn6.enabled = true;
         }
      }
   }
}

