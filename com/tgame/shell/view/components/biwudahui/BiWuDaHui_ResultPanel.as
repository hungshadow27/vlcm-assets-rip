package com.tgame.shell.view.components.biwudahui
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class BiWuDaHui_ResultPanel extends FPanel
   {
      
      public static const BACK_TO_OWN_SERVER:String = "BACK_TO_OWN_SERVER";
      
      private var equipContainerLeft:Sprite;
      
      private var equipContainerRight:Sprite;
      
      private var _dataWin:Object;
      
      private var _dataLose:Object;
      
      private var _leftAvatar:Bitmap;
      
      private var _rightAvatar:Bitmap;
      
      private var leftName:FTextArea;
      
      private var leftLevel:FTextArea;
      
      private var leftZhandouli:FTextArea;
      
      private var rightName:FTextArea;
      
      private var rightLevel:FTextArea;
      
      private var rightZhandouli:FTextArea;
      
      private var winnnerText:FTextArea;
      
      private var arrStar:Array = new Array();
      
      private var imgStarliang:BitmapData;
      
      private var hpBarLeft:ColorBar;
      
      private var hpBarRight:ColorBar;
      
      private var comboNO:Array = ["ui.combo.no.0","ui.combo.no.1","ui.combo.no.2","ui.combo.no.3","ui.combo.no.4","ui.combo.no.5","ui.combo.no.6","ui.combo.no.7","ui.combo.no.8","ui.combo.no.9"];
      
      private var yellowBit:Sprite;
      
      private var blueBit:Sprite;
      
      private var fuwuqiICO:Bitmap;
      
      private var diaoxianLeft:Bitmap;
      
      private var diaoxianRight:Bitmap;
      
      public function BiWuDaHui_ResultPanel()
      {
         var _loc1_:Bitmap = null;
         var _loc2_:BitmapData = null;
         var _loc4_:Bitmap = null;
         var _loc5_:Bitmap = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         width = 500;
         height = 440;
         titleText = LanResManager.getLanCommonTextWords("跨平台比武大会");
         _loc1_ = StaticValue.getBitmapByClassName("ui.biwuDahui.bifen.bg");
         addChild(_loc1_);
         _loc1_.x = 10;
         _loc1_.y = 2;
         this._leftAvatar = new Bitmap();
         addChild(this._leftAvatar);
         this._rightAvatar = new Bitmap();
         addChild(this._rightAvatar);
         _loc2_ = StaticValue.getBitmapByClassName("ui.biwuDahui.star.an").bitmapData;
         this.imgStarliang = StaticValue.getBitmapByClassName("ui.biwuDahui.star.liang").bitmapData;
         var _loc3_:Bitmap = StaticValue.getBitmapByClassName("ui.combo.no.maohao");
         addChild(_loc3_);
         _loc3_.x = 246;
         _loc3_.y = 165;
         _loc4_ = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(_loc4_);
         _loc4_.width = 126;
         _loc4_.height = 8;
         _loc4_.x = 34;
         _loc4_.y = 8;
         _loc5_ = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(_loc5_);
         _loc5_.width = 126;
         _loc5_.height = 8;
         _loc5_.x = 340;
         _loc5_.y = 8;
         this.hpBarLeft = new ColorBar(1,118,5);
         addChild(this.hpBarLeft);
         this.hpBarLeft.x = 38;
         this.hpBarLeft.y = 10;
         this.hpBarRight = new ColorBar(1,118,5);
         addChild(this.hpBarRight);
         this.hpBarRight.x = 344;
         this.hpBarRight.y = 10;
         var _loc6_:BitmapData = StaticValue.getBitmapByClassName("ui.biwuDahui.diaoxian").bitmapData;
         this.diaoxianLeft = new Bitmap(_loc6_);
         this.diaoxianLeft.x = 52;
         this.diaoxianLeft.y = 97;
         this.diaoxianRight = new Bitmap(_loc6_);
         this.diaoxianRight.x = 357;
         this.diaoxianRight.y = 97;
         var _loc7_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc7_);
         _loc7_.x = 45;
         _loc7_.y = 237;
         var _loc8_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc8_);
         _loc8_.x = 63;
         _loc8_.y = 237;
         var _loc9_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc9_);
         _loc9_.x = 81;
         _loc9_.y = 237;
         var _loc10_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc10_);
         _loc10_.x = 99;
         _loc10_.y = 237;
         var _loc11_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc11_);
         _loc11_.x = 117;
         _loc11_.y = 237;
         var _loc12_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc12_);
         _loc12_.x = 135;
         _loc12_.y = 237;
         var _loc13_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc13_);
         _loc13_.x = 351;
         _loc13_.y = 237;
         var _loc14_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc14_);
         _loc14_.x = 369;
         _loc14_.y = 237;
         var _loc15_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc15_);
         _loc15_.x = 387;
         _loc15_.y = 237;
         var _loc16_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc16_);
         _loc16_.x = 405;
         _loc16_.y = 237;
         var _loc17_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc17_);
         _loc17_.x = 423;
         _loc17_.y = 237;
         var _loc18_:Bitmap = new Bitmap(_loc2_);
         addChild(_loc18_);
         _loc18_.x = 441;
         _loc18_.y = 237;
         this.equipContainerLeft = new Sprite();
         this.equipContainerLeft.x = 0;
         this.equipContainerLeft.y = 0;
         addChild(this.equipContainerLeft);
         this.equipContainerRight = new Sprite();
         this.equipContainerRight.x = 225;
         this.equipContainerRight.y = 6;
         addChild(this.equipContainerRight);
         var _loc19_:SecondButton = new SecondButton();
         _loc19_.align = "center";
         _loc19_.label = LanResManager.getLanCommonTextWords("传回原服");
         _loc19_.height = 22;
         _loc19_.addEventListener(MouseEvent.CLICK,this.onLeaveButtonClick);
         _loc19_.x = 212;
         _loc19_.y = 373;
         addChild(_loc19_);
         this.leftName = new FTextArea();
         this.leftName.textColor = StaticValue.BLUE;
         this.leftName.x = 24;
         this.leftName.y = 261;
         this.leftName.width = 150;
         this.leftName.text = "";
         this.leftName.filters = StaticValue.filter;
         addChild(this.leftName);
         this.leftLevel = new FTextArea();
         this.leftLevel.textColor = StaticValue.BLUE;
         this.leftLevel.x = 24;
         this.leftLevel.y = 278;
         this.leftLevel.text = "";
         this.leftLevel.width = 150;
         this.leftLevel.filters = StaticValue.filter;
         addChild(this.leftLevel);
         this.leftZhandouli = new FTextArea();
         this.leftZhandouli.textColor = StaticValue.GREEN;
         this.leftZhandouli.x = 24;
         this.leftZhandouli.y = 295;
         this.leftZhandouli.width = 150;
         this.leftZhandouli.text = "";
         this.leftZhandouli.filters = StaticValue.filter;
         addChild(this.leftZhandouli);
         this.rightName = new FTextArea();
         this.rightName.textColor = StaticValue.BLUE;
         this.rightName.x = 329;
         this.rightName.y = 261;
         this.rightName.width = 150;
         this.rightName.text = "";
         this.rightName.filters = StaticValue.filter;
         addChild(this.rightName);
         this.rightLevel = new FTextArea();
         this.rightLevel.textColor = StaticValue.BLUE;
         this.rightLevel.x = 329;
         this.rightLevel.y = 278;
         this.rightLevel.width = 150;
         this.rightLevel.text = "";
         this.rightLevel.filters = StaticValue.filter;
         addChild(this.rightLevel);
         this.rightZhandouli = new FTextArea();
         this.rightZhandouli.textColor = StaticValue.GREEN;
         this.rightZhandouli.x = 329;
         this.rightZhandouli.y = 295;
         this.rightZhandouli.width = 150;
         this.rightZhandouli.text = "";
         this.rightZhandouli.filters = StaticValue.filter;
         addChild(this.rightZhandouli);
         this.winnnerText = new FTextArea();
         this.winnnerText.textColor = StaticValue.GREEN;
         this.winnnerText.x = 10;
         this.winnnerText.y = 333;
         this.winnnerText.width = 470;
         this.winnnerText.autoSize = "center";
         this.winnnerText.htmlText = "";
         this.winnnerText.filters = StaticValue.filter;
         addChild(this.winnnerText);
         this.fuwuqiICO = new Bitmap();
         addChild(this.fuwuqiICO);
         this.fuwuqiICO.x = 21;
         this.fuwuqiICO.y = 328;
      }
      
      public function setScore(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Bitmap = null;
         var _loc6_:int = 0;
         var _loc8_:Bitmap = null;
         var _loc9_:Bitmap = null;
         for each(_loc5_ in this.arrStar)
         {
            if(contains(_loc5_))
            {
               removeChild(_loc5_);
            }
         }
         _loc6_ = 0;
         while(_loc6_ < param3)
         {
            _loc8_ = new Bitmap(this.imgStarliang);
            addChild(_loc8_);
            _loc8_.x = 45 + _loc6_ * 18;
            _loc8_.y = 237;
            this.arrStar.push(_loc8_);
            _loc6_++;
         }
         var _loc7_:int = 0;
         while(_loc7_ < param4)
         {
            _loc9_ = new Bitmap(this.imgStarliang);
            addChild(_loc9_);
            _loc9_.x = 351 + _loc7_ * 18;
            _loc9_.y = 237;
            this.arrStar.push(_loc9_);
            _loc7_++;
         }
         this.showCount("huang",param1);
         this.showCount("lan",param2);
      }
      
      public function setLeftNameLevel(param1:String, param2:int, param3:Number) : void
      {
         this.leftName.text = LanResManager.getLanCommonTextWords("姓名：") + param1;
         this.leftLevel.text = LanResManager.getLanCommonTextWords("等级：") + param2;
         this.leftZhandouli.text = LanResManager.getLanCommonTextWords("战斗力：") + param3;
      }
      
      public function setRightNameLevel(param1:String, param2:int, param3:Number) : void
      {
         this.rightName.text = LanResManager.getLanCommonTextWords("姓名：") + param1;
         this.rightLevel.text = LanResManager.getLanCommonTextWords("等级：") + param2;
         this.rightZhandouli.text = LanResManager.getLanCommonTextWords("战斗力：") + param3;
      }
      
      public function setWinnerName(param1:String, param2:int) : void
      {
         var _loc3_:BitmapData = null;
         this.winnnerText.htmlText = "<textformat><font size=\'18\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + param1 + "</font>" + "<font size = \'18\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("是本场的获胜者！") + "</font>" + "</textformat>";
         if(param2 == -1)
         {
            this.fuwuqiICO.bitmapData = null;
         }
         else
         {
            _loc3_ = RslLoaderManager.getInstance("ui.pingtai.id." + (param2 - 1),30,30);
            this.fuwuqiICO.bitmapData = _loc3_;
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent)
         {
            parent.removeChild(this);
         }
      }
      
      private function onLeaveButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(BACK_TO_OWN_SERVER));
      }
      
      public function setData(param1:Object, param2:Object, param3:String, param4:int) : void
      {
         this._dataWin = param1;
         this._dataLose = param2;
         if(param4 == -1)
         {
            this.titleText = LanResManager.getLanCommonTextWords("比武大会");
         }
         else
         {
            this.titleText = LanResManager.getLanCommonTextWords("跨平台比武大会");
         }
         this.setLeftNameLevel(param1.name,param1.dengji,param1.zhandouli);
         if(param2.name != null)
         {
            this.setRightNameLevel(param2.name,param2.dengji,param2.zhandouli);
         }
         this.setScore(param1.fenshu,param2.fenshu,param1.xing,param2.xing);
         this.setXueliang(param1.xueliang,param1.xueliangmax,param2.xueliang,param2.xueliangmax);
         this.setWinnerName(param3,param4);
      }
      
      public function clearData() : void
      {
         this.setLeftNameLevel("",0,0);
         this.setRightNameLevel("",0,0);
         this._leftAvatar.bitmapData = null;
         this._rightAvatar.bitmapData = null;
         if(this.diaoxianLeft.parent != null)
         {
            this.diaoxianLeft.parent.removeChild(this.diaoxianLeft);
         }
         if(this.diaoxianRight.parent != null)
         {
            this.diaoxianRight.parent.removeChild(this.diaoxianRight);
         }
      }
      
      public function setAvatar(param1:int, param2:BitmapData, param3:Boolean = false) : void
      {
         if(Boolean(this._dataWin) && this._dataWin.id == param1)
         {
            this.setLeftAvatar(param2,param3);
         }
         else if(Boolean(this._dataLose) && this._dataLose.id == param1)
         {
            this.setRightAvatar(param2,param3);
         }
      }
      
      private function setLeftAvatar(param1:BitmapData, param2:Boolean) : void
      {
         this._leftAvatar.bitmapData = param1;
         if(param2)
         {
            this._leftAvatar.x = 100 - this._leftAvatar.width / 2;
            this._leftAvatar.y = 190 - this._leftAvatar.height - 5;
         }
         else
         {
            this._leftAvatar.x = 100 - this._leftAvatar.width / 2;
            this._leftAvatar.y = 190 - this._leftAvatar.height + 30;
         }
      }
      
      private function setRightAvatar(param1:BitmapData, param2:Boolean) : void
      {
         this._rightAvatar.bitmapData = param1;
         if(param2)
         {
            this._rightAvatar.x = 400 - this._rightAvatar.width / 2;
            this._rightAvatar.y = 190 - this._rightAvatar.height - 5;
         }
         else
         {
            this._rightAvatar.x = 400 - this._rightAvatar.width / 2;
            this._rightAvatar.y = 190 - this._rightAvatar.height + 30;
         }
      }
      
      public function showCount(param1:String, param2:int) : void
      {
         if(param1 == "huang")
         {
            if(this.yellowBit != null)
            {
               this.yellowBit.parent.removeChild(this.yellowBit);
            }
            this.yellowBit = this.getNumsprite(param2,param1);
            this.yellowBit.x = 204;
            this.yellowBit.y = 157;
            this.addChild(this.yellowBit);
         }
         else if(param1 == "lan")
         {
            if(this.blueBit != null)
            {
               this.blueBit.parent.removeChild(this.blueBit);
            }
            this.blueBit = this.getNumsprite(param2,param1);
            this.blueBit.x = 256;
            this.blueBit.y = 157;
            this.addChild(this.blueBit);
         }
      }
      
      private function getNumsprite(param1:int, param2:String) : Sprite
      {
         var _loc6_:Bitmap = null;
         var _loc3_:Sprite = new Sprite();
         var _loc4_:String = param1.toString();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = StaticValue.getBitmapByClassName(this.comboNO[parseInt(_loc4_.charAt(_loc5_))]);
            _loc3_.addChild(_loc6_);
            _loc6_.x = _loc5_ * _loc6_.width;
            _loc5_++;
         }
         _loc3_.mouseChildren = false;
         _loc3_.mouseEnabled = false;
         return _loc3_;
      }
      
      private function setXueliang(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         this.hpBarLeft.setValue(Math.floor(param1),Math.floor(param2));
         this.hpBarRight.setValue(Math.floor(param3),Math.floor(param4));
      }
      
      public function setOnLineState(param1:int, param2:int) : void
      {
         if(param1 == 0)
         {
            addChild(this.diaoxianLeft);
            this.diaoxianLeft.x = 52;
            this.diaoxianLeft.y = 97;
         }
         else if(this.diaoxianLeft.parent != null)
         {
            this.diaoxianLeft.parent.removeChild(this.diaoxianLeft);
         }
         if(param2 == 0)
         {
            addChild(this.diaoxianRight);
            this.diaoxianRight.x = 357;
            this.diaoxianRight.y = 97;
         }
         else if(this.diaoxianRight.parent != null)
         {
            this.diaoxianRight.parent.removeChild(this.diaoxianRight);
         }
      }
   }
}

