package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNhutishangyiPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var btn:SecondButton;
      
      private var spr:Sprite;
      
      private var selectSpr:Sprite;
      
      private var goArr:Array = [724118,723989,724129,723900];
      
      private var selectID:int = -1;
      
      private var selectMC:DisplayObject;
      
      public function YNhutishangyiPanel()
      {
         super();
         width = 345;
         height = 175;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("护体上衣");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
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
         var _loc3_:ItemFace = null;
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynHuodong/jdsb_bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.spr = new Sprite();
         addChild(this.spr);
         this.selectSpr = new Sprite();
         addChild(this.selectSpr);
         var _loc2_:int = 0;
         while(_loc2_ < 4)
         {
            _loc3_ = new ItemFace(new Goods(int(this.goArr[_loc2_])),65,65);
            _loc3_.x = 30 + 70 * _loc2_;
            _loc3_.y = 20;
            _loc3_.name = this.goArr[_loc2_];
            _loc3_.addEventListener(MouseEvent.CLICK,this.onItemClick);
            this.spr.addChild(_loc3_);
            _loc2_++;
         }
         this.btn = new SecondButton();
         this.btn.x = 140;
         this.btn.y = 102;
         this.btn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.btn);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[70,this.selectID]);
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

