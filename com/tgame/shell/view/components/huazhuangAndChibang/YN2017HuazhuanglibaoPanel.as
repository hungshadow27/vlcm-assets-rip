package com.tgame.shell.view.components.huazhuangAndChibang
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YN2017HuazhuanglibaoPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var btn:SecondButton;
      
      private var spr:Sprite;
      
      private var selectSpr:Sprite;
      
      private var goArr:Array = [];
      
      private var selectID:int = -1;
      
      private var selectMC:DisplayObject;
      
      public function YN2017HuazhuanglibaoPanel()
      {
         super();
         width = 467 + 300 - 85 - 300;
         height = 280;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("化妆礼包");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         if(GameInstance.mainCharData.attributeInfo.getSex() == 1)
         {
            this.goArr = [7500056,7500058,7500060,7500062,7500064,7500066,7500068,7500070,7500072];
         }
         else
         {
            this.goArr = [7500057,7500059,7500061,7500063,7500065,7500067,7500069,7500071,7500073];
         }
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         var _loc2_:ItemFace = null;
         this.spr = new Sprite();
         addChild(this.spr);
         this.selectSpr = new Sprite();
         addChild(this.selectSpr);
         _loc1_ = 0;
         while(_loc1_ < this.goArr.length)
         {
            _loc2_ = new ItemFace(new Goods(int(this.goArr[_loc1_])),65,65);
            _loc2_.x = 25 + _loc1_ % 5 * 70;
            _loc2_.y = 25 + int(_loc1_ / 5) * 85;
            _loc2_.name = this.goArr[_loc1_];
            _loc2_.addEventListener(MouseEvent.CLICK,this.onItemClick);
            this.spr.addChild(_loc2_);
            _loc1_++;
         }
         this.btn = new SecondButton();
         this.btn.x = 350 - 220;
         this.btn.y = 193;
         this.btn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.btn);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53099,[48,this.selectID]);
         this.onClose(null);
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         if(this.selectSpr.getChildByName("selectMC"))
         {
            this.selectSpr.removeChild(this.selectMC);
         }
         this.selectID = int(_loc2_.name);
         this.selectMC = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2016yuanxiaojie/select.swf");
         this.selectMC.name = "selectMC";
         this.selectMC.x = _loc2_.x - 2;
         this.selectMC.y = _loc2_.y - 2;
         this.selectSpr.addChild(this.selectMC);
      }
   }
}

