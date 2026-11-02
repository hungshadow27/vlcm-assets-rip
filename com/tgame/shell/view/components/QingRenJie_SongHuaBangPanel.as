package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class QingRenJie_SongHuaBangPanel extends FPanel
   {
      
      public static const UI_QINGRENJIESONGHUABANG_SHOW_NANSHENBANG:String = "UI_QINGRENJIESONGHUABANG_SHOW_NANSHENBANG";
      
      public static const UI_QINGRENJIESONGHUABANG_SHOW_NVSHENBANG:String = "UI_QINGRENJIESONGHUABANG_SHOW_NVSHENBANG";
      
      public static const UI_QINGRENJIESONGHUABANG_SHANGYIYE_CLICK:String = "UI_QINGRENJIESONGHUABANG_SHANGYIYE_CLICK";
      
      public static const UI_QINGRENJIESONGHUABANG_XIAYIYE_CLICK:String = "UI_QINGRENJIESONGHUABANG_XIAYIYE_CLICK";
      
      public static const UI_QINGRENJIESONGHUABANG_CHAKAN_CLICK:String = "UI_QINGRENJIESONGHUABANG_CHAKAN_CLICK";
      
      public static const UI_QINGRENJIESONGHUABANG_BIANSHEN_CLICK:String = "UI_QINGRENJIESONGHUABANG_BIANSHEN_CLICK";
      
      private var tabBar:FTabBar;
      
      private var count:FTextArea;
      
      private var dangqianye:int = 0;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var chakanziliaoBtn:SecondButton;
      
      private var bianshenBtn:SecondButton;
      
      private var fc1:FCanvas;
      
      private var shangfan:int = 0;
      
      private var xiafan:int = 0;
      
      private var bg1:DisplayObject;
      
      private var shangyiyeBtn:FSimpleButton;
      
      private var xiayiyeBtn:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tf:TextFormat;
      
      private var bangType:int = 0;
      
      public function QingRenJie_SongHuaBangPanel()
      {
         var ft1:FTextArea;
         super();
         skin = "panel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 284 + 10;
         height = 267 + 90 + 18;
         titleText = LanResManager.getLanCommonTextWords("人气榜");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/qingrenjiexianhua/songhuabang.swf");
         this.bg1.x = 2 + 6 + 1;
         this.bg1.y = 2 + 21;
         addChild(this.bg1);
         this.tabBar = new FTabBar();
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("女神榜"),this.onTabBarClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("男神榜"),this.onTabBarClick);
         this.count = new FTextArea();
         addChild(this.count);
         this.count.multiline = true;
         this.count.wordWrap = true;
         this.count.width = 230 - 50;
         this.count.x = 130 + 65;
         this.count.y = 5;
         ft1 = new FTextArea();
         addChild(ft1);
         ft1.multiline = true;
         ft1.wordWrap = true;
         ft1.width = 300;
         ft1.x = 15 + 5;
         ft1.y = 18 + 5 + 6;
         ft1.htmlText = "<font  color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("排名") + "                        " + LanResManager.getLanCommonTextWords("姓名") + "                 " + LanResManager.getLanCommonTextWords("收到花朵数量") + "</font>";
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 20 - 10;
            y = 40 + 11;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,345 + 20 + 15 + 60 + 10 + 19 - 135 - 63,125);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new SongHuaBangList();
         this.giftList.listWidth = 345 + 20 + 15 + 60 + 10 + 19 - 135 - 63;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.shangyiyeBtn = new FSimpleButton();
         this.shangyiyeBtn.skin = "previousButton";
         addChild(this.shangyiyeBtn);
         this.shangyiyeBtn.x = 50 + 54 + 9;
         this.shangyiyeBtn.y = 280 - 4;
         this.shangyiyeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 150 - 27 - 3;
         this.cengshu.y = 280 - 2 - 2;
         this.xiayiyeBtn = new FSimpleButton();
         this.xiayiyeBtn.skin = "nextButton";
         addChild(this.xiayiyeBtn);
         this.xiayiyeBtn.x = 170 - 10;
         this.xiayiyeBtn.y = 280 - 4;
         this.xiayiyeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.chakanziliaoBtn = new SecondButton();
         this.chakanziliaoBtn.label = LanResManager.getLanCommonTextWords("查看资料");
         addChild(this.chakanziliaoBtn);
         this.chakanziliaoBtn.x = 50;
         this.chakanziliaoBtn.y = 350 - 42;
         this.chakanziliaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.bianshenBtn = new SecondButton();
         this.bianshenBtn.label = LanResManager.getLanCommonTextWords("我要变身");
         addChild(this.bianshenBtn);
         this.bianshenBtn.x = 170;
         this.bianshenBtn.y = 350 - 42;
         this.bianshenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onTabBarClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("男神榜"):
               this.bangType = 1;
               dispatchEvent(new BaseEvent(UI_QINGRENJIESONGHUABANG_SHOW_NANSHENBANG));
               break;
            case LanResManager.getLanCommonTextWords("女神榜"):
               this.bangType = 0;
               dispatchEvent(new BaseEvent(UI_QINGRENJIESONGHUABANG_SHOW_NVSHENBANG));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeBtn:
               this.dispatchEvent(new BaseEvent(UI_QINGRENJIESONGHUABANG_SHANGYIYE_CLICK,"",[this.bangType,this.dangqianye - 1]));
               break;
            case this.xiayiyeBtn:
               this.dispatchEvent(new BaseEvent(UI_QINGRENJIESONGHUABANG_XIAYIYE_CLICK,"",[this.bangType,this.dangqianye + 1]));
               break;
            case this.bianshenBtn:
               this.dispatchEvent(new BaseEvent(UI_QINGRENJIESONGHUABANG_BIANSHEN_CLICK));
               break;
            case this.chakanziliaoBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_LOOK_INFOBTN_CLICK,"",int(this.giftList.selectItem.id)));
         }
      }
      
      public function setInitialize(param1:Array, param2:Number, param3:int, param4:int) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param3 + "/" + param4 + "</font>";
         this.dangqianye = param3;
         if(this.dangqianye <= 1)
         {
            this.shangyiyeBtn.enabled = false;
         }
         else
         {
            this.shangyiyeBtn.enabled = true;
         }
         if(this.dangqianye >= param4)
         {
            this.xiayiyeBtn.enabled = false;
         }
         else
         {
            this.xiayiyeBtn.enabled = true;
         }
         this.giftList.dataProvider = param1;
         if(param1.length == 0)
         {
            this.chakanziliaoBtn.enabled = false;
         }
         else
         {
            this.chakanziliaoBtn.enabled = true;
            this.giftList.setSelectItemByIndex(0);
         }
         this.count.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前花朵数量：") + param2 + "</font>";
      }
   }
}

