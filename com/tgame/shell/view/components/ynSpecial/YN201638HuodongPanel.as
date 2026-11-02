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
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class YN201638HuodongPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var btn:SecondButton;
      
      public function YN201638HuodongPanel()
      {
         super();
         width = 460;
         height = 193;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("女权活动");
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
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/201638huodong/nvquan_bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 25;
         this.ft.y = 2;
         this.ft.htmlText = "<font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("【时间】") + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("2016年3月8号（0点） - 2016年3月8号（23点59分）") + "</font>";
         this.ft.width = 405;
         this.ft.height = 25;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 25;
         this.ft.y = 20;
         this.ft.htmlText = "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("【内容】") + "</font><br>" + "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家在活动之间，参加充值2000元宝，将会获得称号，只能领取一次。") + "</font>";
         this.ft.width = 405;
         this.ft.height = 60;
         this.ft.wordWrap = true;
         this.ft.multiline = true;
         addChild(this.ft);
         var _loc2_:ItemFace = new ItemFace(new Goods(724705),65,65);
         _loc2_.x = 52;
         _loc2_.y = 78;
         addChild(_loc2_);
         this.ft = new FTextArea();
         this.ft.x = 120;
         this.ft.y = 100;
         this.ft.htmlText = "<font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("“女权”称号") + "</font>";
         this.ft.width = 405;
         this.ft.height = 25;
         addChild(this.ft);
         this.btn = new SecondButton();
         this.btn.x = 300;
         this.btn.y = 100;
         this.btn.label = LanResManager.getLanCommonTextWords("领取");
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[66]);
      }
   }
}

