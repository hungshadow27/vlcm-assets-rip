package com.tgame.shell.view.components.tunshitiandi
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class TunShiTianDi_JieGuo extends FPanel
   {
      
      public static const TUNSHITIANDI_CHUANHUIYUANFU_CLICK:String = "TUNSHITIANDI_CHUANHUIYUANFU_CLICK";
      
      private var bg:DisplayObject;
      
      private var winImg:DisplayObject;
      
      private var pingImg:DisplayObject;
      
      private var chuanhuiBtn:SecondButton;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var listContainer1:Sprite;
      
      private var giftList1:FList;
      
      private var bifen:FTextArea;
      
      private var tf:TextFormat;
      
      public function TunShiTianDi_JieGuo()
      {
         var ft:FTextArea = null;
         super();
         titleText = LanResManager.getLanCommonTextWords("吞食天地");
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 600;
         height = 380;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/jieguo.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         ft = new FTextArea();
         ft.filters = StaticValue.filter;
         ft.width = 570;
         ft.height = 20;
         ft.x = 22;
         ft.y = 110;
         ft.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("名次") + "          " + LanResManager.getLanCommonTextWords("姓名") + "         " + LanResManager.getLanCommonTextWords("获得积分") + "                     " + LanResManager.getLanCommonTextWords("名次") + "          " + LanResManager.getLanCommonTextWords("姓名") + "         " + LanResManager.getLanCommonTextWords("获得积分") + "</font>";
         addChild(ft);
         ft = new FTextArea();
         ft.filters = StaticValue.filter;
         ft.defaultTextFormat = this.tf;
         ft.width = 100;
         ft.height = 20;
         ft.x = 263 - 15;
         ft.y = 150;
         ft.htmlText = "<font size = \'16\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("双方比分") + "</font>";
         addChild(ft);
         this.bifen = new FTextArea();
         this.bifen.filters = StaticValue.filter;
         this.bifen.defaultTextFormat = this.tf;
         this.bifen.width = 100;
         this.bifen.height = 20;
         this.bifen.x = 263 - 15;
         this.bifen.y = 170;
         this.bifen.htmlText = "<font size = \'16\' color=\'" + StaticValue.GREEN_HTML + "\'>" + " " + "</font>";
         addChild(this.bifen);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 11;
            y = 132;
         }
         this.listContainer.mouseChildren = false;
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new TunShiTianDi_JieGuoList();
         this.giftList.listWidth = 237;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.listContainer1 = new Sprite();
         addChild(this.listContainer1);
         with(this.listContainer1)
         {
            x = 11 + 335;
            y = 132;
         }
         this.listContainer1.mouseChildren = false;
         this.giftList1 = new FList();
         this.giftList1.skin = "list";
         this.giftList1.itemRenderer = new TunShiTianDi_JieGuoList();
         this.giftList1.listWidth = 237;
         this.listContainer1.addChild(this.giftList1);
         this.giftList1.x = 0;
         this.giftList1.y = 0;
         this.chuanhuiBtn = new SecondButton();
         this.chuanhuiBtn.label = LanResManager.getLanCommonTextWords("传回原服");
         this.chuanhuiBtn.x = 257 + 8;
         this.chuanhuiBtn.y = 317;
         addChild(this.chuanhuiBtn);
         this.chuanhuiBtn.addEventListener(MouseEvent.CLICK,this.fun);
         this.winImg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/win.swf");
         this.winImg.visible = false;
         addChild(this.winImg);
         this.pingImg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/ping.swf");
         this.pingImg.visible = false;
         this.pingImg.x = 263 - 15 + 10;
         this.pingImg.y = 200;
         addChild(this.pingImg);
      }
      
      public function onClose(param1:* = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
         this.clearData();
      }
      
      private function fun(param1:MouseEvent) : void
      {
         this.dispatchEvent(new BaseEvent(TUNSHITIANDI_CHUANHUIYUANFU_CLICK));
      }
      
      public function setInitialize(param1:int, param2:int, param3:Array, param4:Array, param5:int) : void
      {
         this.bifen.htmlText = "<font size = \'16\' color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + "/" + param2 + "</font>";
         this.giftList.dataProvider = param3;
         this.giftList1.dataProvider = param4;
         this.setWinImg(param5);
      }
      
      public function setWinImg(param1:int) : void
      {
         this.winImg.visible = false;
         this.pingImg.visible = false;
         if(param1 == 1)
         {
            this.winImg.visible = false;
            this.pingImg.visible = true;
         }
         else if(param1 == 0)
         {
            this.winImg.visible = true;
            this.winImg.x = 160;
            this.winImg.y = 30;
         }
         else
         {
            this.winImg.visible = true;
            this.winImg.x = 360;
            this.winImg.y = 30;
         }
      }
      
      public function clearData() : void
      {
         this.bifen.htmlText = "<font size = \'16\' color=\'" + StaticValue.GREEN_HTML + "\'>" + 0 + "/" + 0 + "</font>";
         this.giftList.dataProvider = null;
         this.giftList1.dataProvider = null;
      }
   }
}

