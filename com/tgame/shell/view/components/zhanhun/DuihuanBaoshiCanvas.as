package com.tgame.shell.view.components.zhanhun
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.shell.view.components.ZhanHunPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Dictionary;
   
   public class DuihuanBaoshiCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var shuliang:FTextArea;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var yeshu:FTextArea;
      
      private var dangqianye:int;
      
      private var zuidaye:int;
      
      private var container:Sprite;
      
      private var dictZhanHun:Dictionary;
      
      private var zhanHunArr:Array;
      
      public function DuihuanBaoshiCanvas()
      {
         super();
         var _loc1_:* = new FTextArea();
         addChild(_loc1_);
         _loc1_.multiline = true;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.wordWrap = true;
         _loc1_.width = 400;
         _loc1_.height = 100;
         _loc1_.x = 20;
         _loc1_.y = 330 - 55 + 15 + 2;
         _loc1_.htmlText = "<font leading=\'20\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击兑换按钮，则可将对应的战魂转换为战魂宝石") + "<br>" + LanResManager.getLanCommonTextWords("战魂宝石可以兑换各种稀有战魂") + "<br>" + LanResManager.getLanCommonTextWords("每个战魂可以兑换战魂宝石2颗") + "</font>";
         this.shuliang = new FTextArea();
         addChild(this.shuliang);
         this.shuliang.multiline = true;
         this.shuliang.autoSize = TextFieldAutoSize.LEFT;
         this.shuliang.wordWrap = true;
         this.shuliang.width = 400;
         this.shuliang.height = 100;
         this.shuliang.x = 547 - 125 - 385;
         this.shuliang.y = 330 - 55 - 21 + 13;
         this.shuliang.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("战魂宝石数量") + "：</font>";
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240;
         this.shangyiyeButton.y = 330 - 55 - 21 + 13;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yeshu = new FTextArea();
         this.yeshu.autoSize;
         addChild(this.yeshu);
         this.yeshu.multiline = true;
         this.yeshu.autoSize = TextFieldAutoSize.LEFT;
         this.yeshu.wordWrap = true;
         this.yeshu.width = 150;
         this.yeshu.height = 30;
         this.yeshu.x = 245 + 50;
         this.yeshu.y = 330 - 55 - 21 + 13;
         this.yeshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>123131</font>";
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 100;
         this.xiayiyeButton.y = 330 - 55 - 21 + 13;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.container = new Sprite();
         addChild(this.container);
         this.zhanHunArr = new Array();
         this.dictZhanHun = new Dictionary();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this.$parent.dispatchEvent(new BaseEvent(ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_SHANGYIYE,"",this.dangqianye - 1));
               break;
            case this.xiayiyeButton:
               this.$parent.dispatchEvent(new BaseEvent(ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_XIAYIYE,"",this.dangqianye + 1));
         }
      }
      
      private function onComItemFace(param1:DisplayObject) : void
      {
         if(param1 != null && Boolean(param1.parent))
         {
            param1.parent.removeChild(param1);
            if(param1 is ItemFace)
            {
               (param1 as ItemFace).destroy();
            }
         }
      }
      
      private function onDuiHuanClick(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.target.name;
         var _loc3_:Array = _loc2_.split(",");
         var _loc4_:int = Number(_loc3_[0]);
         var _loc5_:int = Number(_loc3_[1]);
         this.$parent.dispatchEvent(new BaseEvent(ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_DUIHUAN,"",[_loc4_,_loc5_]));
      }
      
      private function addZhanHunToStage(param1:int, param2:Object) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc8_:FTextArea = null;
         _loc3_ = 27 - 9 + param1 % 6 * 100;
         _loc4_ = 20 + 12 - 9 - 10 + Math.floor(param1 / 6) * 120;
         var _loc5_:Sprite = new Sprite();
         var _loc6_:McBaseItem = new McBaseItem(param2.goodid);
         _loc6_.daojuId = param2.goodid;
         _loc6_.name = param2.name;
         _loc6_.dengji = param2.dengji;
         _loc6_.quality = param2.type;
         _loc6_.miaoshu = param2.miaoshu;
         _loc6_.jiage = param2.price;
         var _loc7_:ItemFace = new ItemFace(_loc6_);
         _loc7_.name = param2.id + "," + param2.count;
         _loc7_.setMcName(true,true);
         _loc7_.x = 5;
         _loc7_.y = 3.5;
         _loc5_.addChildAt(_loc7_,0);
         _loc8_ = new FTextArea();
         _loc8_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>1</font>";
         _loc8_.x = 35;
         _loc8_.y = 65 + 5;
         _loc8_.width = 100;
         _loc8_.height = 20;
         _loc5_.addChild(_loc8_);
         var _loc9_:SmallButton = new SmallButton();
         _loc9_.label = LanResManager.getLanCommonTextWords("兑换");
         _loc9_.name = param2.goodid + "," + param2.count;
         _loc5_.addChild(_loc9_);
         _loc9_.x = 20;
         _loc9_.y = 65 + 20 + 10;
         _loc9_.addEventListener(MouseEvent.CLICK,this.onDuiHuanClick);
         _loc5_.x = _loc3_;
         _loc5_.y = _loc4_;
         this.container.addChild(_loc5_);
         this.dictZhanHun[param2.id] = _loc5_;
      }
      
      public function setBaoShi(param1:int) : void
      {
         this.shuliang.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("战魂宝石数量：") + param1 + "</font>";
      }
      
      private function removeZhanHun() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObject = null;
         while(this.container.numChildren > 0)
         {
            _loc1_ = this.container.removeChildAt(0);
            if(_loc1_ is Sprite)
            {
               _loc2_ = (_loc1_ as Sprite).getChildAt(0);
               if(_loc2_ is ItemFace)
               {
                  this.onComItemFace(_loc2_);
               }
            }
         }
      }
      
      public function setZhanHun(param1:Array) : void
      {
         this.removeZhanHun();
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         this.dictZhanHun = new Dictionary();
         this.zhanHunArr = new Array();
         this.zhanHunArr = param1;
         var _loc2_:* = 0;
         while(_loc2_ < param1.length)
         {
            this.addZhanHunToStage(_loc2_,param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function setYeShu(param1:int, param2:int) : void
      {
         if(param2 == 0)
         {
            param2 = 1;
         }
         this.yeshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "/" + param2 + "</font>";
         this.dangqianye = param1;
         this.zuidaye = param2;
         if(param1 == 1)
         {
            this.shangyiyeButton.enabled = false;
         }
         else
         {
            this.shangyiyeButton.enabled = true;
         }
         if(param1 == param2)
         {
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            this.xiayiyeButton.enabled = true;
         }
      }
   }
}

