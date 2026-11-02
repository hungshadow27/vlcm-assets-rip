package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNCommitGoodPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var btn:SecondButton;
      
      private var spr:Sprite;
      
      private var type:int;
      
      public function YNCommitGoodPanel()
      {
         super();
         titleText = LanResManager.getLanCommonTextWords("兑换礼包");
         skin = "panel_btn";
         width = 300;
         height = 170;
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.y = 65;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("点击按钮提交物品兑换礼包");
         this.ft.width = 250;
         this.ft.x = width / 2 - this.ft.textWidth / 2;
         this.ft.textColor = StaticValue.GREEN;
         addChild(this.ft);
         this.btn = new SecondButton();
         this.btn.y = 105;
         this.btn.label = LanResManager.getLanCommonTextWords("兑换");
         this.btn.x = width / 2 - this.btn.width;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn);
         this.spr = new Sprite();
         addChild(this.spr);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[this.type]);
      }
      
      public function setData(param1:Array, param2:int) : void
      {
         var _loc5_:Bitmap = null;
         var _loc6_:Array = null;
         var _loc7_:Goods = null;
         var _loc8_:int = 0;
         var _loc9_:ItemFace = null;
         this.type = param2;
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         var _loc3_:int = 0;
         if(param1.length == 1)
         {
            _loc3_ = width / 2 - 33;
         }
         else if(param1.length == 2)
         {
            _loc3_ = width / 2 - 65;
         }
         else if(param1.length == 3)
         {
            _loc3_ = width / 2 - 90;
         }
         else if(param1.length == 4)
         {
            _loc3_ = width / 2 - 120;
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc5_.x = _loc3_ + 60 * _loc4_;
            _loc5_.y = 22;
            this.spr.addChild(_loc5_);
            _loc6_ = String(param1[_loc4_]).split(",");
            _loc7_ = new Goods(int(_loc6_[0]));
            _loc8_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(int(_loc6_[0]),true);
            _loc9_ = new ItemFace(_loc7_);
            _loc9_.x = _loc3_ + 2 + 60 * _loc4_;
            _loc9_.y = 24;
            _loc9_.count = int(_loc6_[1]);
            if(_loc8_ < int(_loc6_[1]))
            {
               _loc9_.filters = Tools.blackWhiteFilter;
            }
            else
            {
               _loc9_.filters = [];
            }
            this.spr.addChild(_loc9_);
            _loc4_++;
         }
      }
   }
}

