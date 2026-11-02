package com.tgame.shell.view.components.woHuCangLong
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class WoHuCangLongResultPanel extends FPanel
   {
      
      public static const BACK_TO_OWN_SERVER:String = "BACK_TO_OWN_SERVER";
      
      private var _leftAvatar:Bitmap;
      
      private var _rightAvatar:Bitmap;
      
      private var leftName:FTextArea;
      
      private var leftLevel:FTextArea;
      
      private var jiangLiFta:FTextArea;
      
      private var rightName:FTextArea;
      
      private var rightLevel:FTextArea;
      
      private var rightJiangLiFta:FTextArea;
      
      private var winnnerText:FTextArea;
      
      private var bg:DisplayObject;
      
      private var winMc:MovieClip;
      
      private var winner:int;
      
      public function WoHuCangLongResultPanel()
      {
         var _loc1_:SecondButton = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         width = 500;
         height = 440;
         titleText = LanResManager.getLanCommonTextWords("卧虎藏龙");
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/result.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this._leftAvatar = new Bitmap();
         addChild(this._leftAvatar);
         this._rightAvatar = new Bitmap();
         addChild(this._rightAvatar);
         _loc1_ = new SecondButton();
         _loc1_.align = "center";
         _loc1_.label = LanResManager.getLanCommonTextWords("传回原服");
         _loc1_.height = 22;
         _loc1_.addEventListener(MouseEvent.CLICK,this.onLeaveButtonClick);
         _loc1_.x = 212;
         _loc1_.y = 373;
         addChild(_loc1_);
         this.leftName = new FTextArea();
         this.leftName.textColor = StaticValue.BLUE;
         this.leftName.x = 24;
         this.leftName.y = 261 - 12;
         this.leftName.width = 150;
         this.leftName.text = "";
         this.leftName.filters = StaticValue.filter;
         addChild(this.leftName);
         this.leftLevel = new FTextArea();
         this.leftLevel.textColor = StaticValue.BLUE;
         this.leftLevel.x = 24;
         this.leftLevel.y = 278 - 12;
         this.leftLevel.text = "";
         this.leftLevel.width = 150;
         this.leftLevel.filters = StaticValue.filter;
         addChild(this.leftLevel);
         this.jiangLiFta = new FTextArea();
         this.jiangLiFta.textColor = StaticValue.GREEN;
         this.jiangLiFta.x = 24;
         this.jiangLiFta.y = 295 - 12;
         this.jiangLiFta.width = 250;
         this.jiangLiFta.text = "";
         this.jiangLiFta.filters = StaticValue.filter;
         addChild(this.jiangLiFta);
         this.rightName = new FTextArea();
         this.rightName.textColor = StaticValue.BLUE;
         this.rightName.x = 329;
         this.rightName.y = 261 - 12;
         this.rightName.width = 150;
         this.rightName.text = "";
         this.rightName.filters = StaticValue.filter;
         addChild(this.rightName);
         this.rightLevel = new FTextArea();
         this.rightLevel.textColor = StaticValue.BLUE;
         this.rightLevel.x = 329;
         this.rightLevel.y = 278 - 12;
         this.rightLevel.width = 150;
         this.rightLevel.text = "";
         this.rightLevel.filters = StaticValue.filter;
         addChild(this.rightLevel);
         this.rightJiangLiFta = new FTextArea();
         this.rightJiangLiFta.textColor = StaticValue.GREEN;
         this.rightJiangLiFta.x = 329;
         this.rightJiangLiFta.y = 295 - 12;
         this.rightJiangLiFta.width = 250;
         this.rightJiangLiFta.text = "";
         this.rightJiangLiFta.filters = StaticValue.filter;
         addChild(this.rightJiangLiFta);
         this.winnnerText = new FTextArea();
         this.winnnerText.textColor = StaticValue.GREEN;
         this.winnnerText.x = 10;
         this.winnnerText.y = 325;
         this.winnnerText.width = 470;
         this.winnnerText.autoSize = "center";
         this.winnnerText.htmlText = "";
         this.winnnerText.filters = StaticValue.filter;
         addChild(this.winnnerText);
      }
      
      public function setLeftNameLevel(param1:String, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.leftName.text = LanResManager.getLanCommonTextWords("姓名：") + param1;
         this.leftLevel.text = LanResManager.getLanCommonTextWords("等级：") + param2;
         this.jiangLiFta.htmlText = LanResManager.getLanCommonTextWords("奖励：威望") + param3 + LanResManager.getLanCommonTextWords("，功勋") + param4;
      }
      
      public function setRightNameLevel(param1:String, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.rightName.text = LanResManager.getLanCommonTextWords("姓名：") + param1;
         this.rightLevel.text = LanResManager.getLanCommonTextWords("等级：") + param2;
         this.rightJiangLiFta.htmlText = LanResManager.getLanCommonTextWords("奖励：威望") + param3 + LanResManager.getLanCommonTextWords("，功勋") + param4;
      }
      
      public function setWinnerName(param1:String, param2:int, param3:int) : void
      {
         this.winnnerText.htmlText = "<textformat><font size=\'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + "【" + OtherConst.getPingTaiById(param2) + "】" + param1 + "</font>" + "<font size = \'14\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("是本场的获胜者！") + "</font>" + "<br>" + "<font size = \'14\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("所得奖励通过原服跨服包裹领取。") + "</font>" + "</textformat>";
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent)
         {
            parent.removeChild(this);
         }
         this.clearData();
      }
      
      private function onLeaveButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(BACK_TO_OWN_SERVER));
      }
      
      public function clearData() : void
      {
         this.setLeftNameLevel("",0,0,0,0);
         this.setRightNameLevel("",0,0,0,0);
         this._leftAvatar.bitmapData = null;
         this._rightAvatar.bitmapData = null;
         if(Boolean(this.winMc) && this.winMc.parent != null)
         {
            this.winMc.stop();
            this.winMc.parent.removeChild(this.winMc);
         }
      }
      
      public function setAvatar(param1:int, param2:BitmapData, param3:Boolean = false) : void
      {
         if(0 == param1)
         {
            this.setLeftAvatar(param2,param3);
         }
         else if(1 == param1)
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
      
      public function setPanel(param1:String, param2:int, param3:int, param4:Array) : void
      {
         this.setLeftNameLevel("",0,0,0,0);
         this.setRightNameLevel("",0,0,0,0);
         this.winner = -1;
         var _loc5_:int = 0;
         while(_loc5_ < param4.length)
         {
            if(_loc5_ == 0)
            {
               this.setLeftNameLevel(param4[_loc5_].name,param4[_loc5_].level,param4[_loc5_].weiWang,param4[_loc5_].gongXun,param4[_loc5_].chouHenZhi);
            }
            else
            {
               this.setRightNameLevel(param4[_loc5_].name,param4[_loc5_].level,param4[_loc5_].weiWang,param4[_loc5_].gongXun,param4[_loc5_].chouHenZhi);
            }
            if(param1 == param4[_loc5_].name)
            {
               this.winner = _loc5_;
            }
            _loc5_++;
         }
         if(this.winner != -1)
         {
            this.showWinMc();
         }
         this.setWinnerName(param1,param2,param3);
      }
      
      public function showWinMc() : void
      {
         var loadUrl:String = null;
         if(this.winMc != null)
         {
            if(this.winMc.parent == null)
            {
               addChild(this.winMc);
            }
            this.winMc.x = this.winner == 0 ? 35 : 340;
            this.winMc.y = -40;
            this.winMc.gotoAndPlay(0);
         }
         else
         {
            loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/win.swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(winMc) && winMc.parent != null)
               {
                  winMc.stop();
                  winMc.parent.removeChild(winMc);
               }
               winMc = _loc2_.content as MovieClip;
               if(winMc)
               {
                  winMc.play();
                  addChild(winMc);
                  winMc.x = winner == 0 ? 35 : 370;
                  winMc.y = -40;
               }
            },null,false,loadUrl);
         }
      }
   }
}

