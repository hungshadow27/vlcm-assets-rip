package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.party.PartyFlag_memberListRedner;
   import com.tgame.shell.view.components.party.Party_contribute_copperPanel;
   import com.tgame.shell.view.components.party.Party_contribute_tokenPanel;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class PartyContributePanel extends FPanel
   {
      
      public static const UI_PARTYFLAGPANEL_PARTYLIST_SHOW_QUALIFICATION:String = "UI_PARTYFLAGPANEL_PARTYLIST_SHOW_QUALIFICATION";
      
      public static const UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_BTN_CLICK:String = "UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_BTN_CLICK";
      
      public static const UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_BTN_CLICK:String = "UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_BTN_CLICK";
      
      public static const UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_PUT:String = "UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_PUT";
      
      public static const UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_OK:String = "UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_OK";
      
      public static const UI_PARTYFLAGPANEL_TOKEN_DRAG_ENTER:String = "UI_PARTYFLAGPANEL_TOKEN_DRAG_ENTER";
      
      public static const UI_PARTYFLAGPANEL_TOKEN_CLICK:String = "UI_PARTYFLAGPANEL_TOKEN_CLICK";
      
      public static const UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_OK:String = "UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_OK";
      
      public static const UI_PARTYFLAGPANEL_PANEL_SHOW_MENU:String = "UI_PARTYFLAGPANEL_PANEL_SHOW_MENU";
      
      public static const UI_PARTYFLAGPANEL_DUIHUANBANGPAIKUOZHANFU_OK:String = "UI_PARTYFLAGPANEL_DUIHUANBANGPAIKUOZHANFU_OK";
      
      private var upgradeCount:FTextArea;
      
      private var tokenContainer:Sprite;
      
      private var copper:FLabel;
      
      private var copperBtn:SmallButton;
      
      private var tokenBtn:SmallButton;
      
      private var sortText:String = "";
      
      private var partyList:FList;
      
      private var listScroll:FVScorllBar;
      
      private var renameBtn:SecondButton;
      
      private var changeBtn:SecondButton;
      
      private var upgradeBtn:SecondButton;
      
      private var fixBtn:SecondButton;
      
      private var helpBtn:SecondButton;
      
      private var PaginalTxt:FTextArea;
      
      private var selectBtn3:FSimpleButton;
      
      private var listContainer3:FCanvas;
      
      private var selectList3:FList;
      
      private var topBtn:SecondButton;
      
      private var btnBtn:SecondButton;
      
      private var pageTxt:FTextArea;
      
      private var contributeValue:FLabel;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var contributeTokenPanel:Party_contribute_tokenPanel;
      
      private var contributeCopperPanel:Party_contribute_copperPanel;
      
      private var kuozhanfuBtn:SecondButton;
      
      public function PartyContributePanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var lb:FLabel;
         var sortBtn:FSimpleButton;
         var bg:F9GridBitmap;
         var tf:TextFormat;
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 680;
         height = 380;
         titleText = LanResManager.getLanCommonTextWords("帮会贡献");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.party.contribute.ui";
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         this.tokenContainer = new Sprite();
         addChild(this.tokenContainer);
         this.tokenContainer.x = 41;
         this.tokenContainer.y = 36;
         this.kuozhanfuBtn = new SecondButton();
         this.kuozhanfuBtn.x = 545;
         this.kuozhanfuBtn.y = 30;
         this.kuozhanfuBtn.label = LanResManager.getLanCommonTextWords("兑换帮派扩展符");
         addChild(this.kuozhanfuBtn);
         this.kuozhanfuBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("兑换帮派扩展符需要消耗帮主令18个，青龙令268个，白虎令268个，玄武令268个，铜币168888888") + "</font>";
         this.kuozhanfuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 305;
            y = 30;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮贡铜钱存量") + "：";
         }
         addChild(lb);
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 404;
         img.y = 28;
         this.copper = new FLabel();
         with(this.copper)
         {
            x = 424;
            y = 30;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "99999";
         }
         addChild(this.copper);
         this.copperBtn = new SmallButton();
         this.copperBtn.label = LanResManager.getLanCommonTextWords("贡献铜钱");
         addChild(this.copperBtn);
         this.copperBtn.x = 314;
         this.copperBtn.y = 58;
         this.copperBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tokenBtn = new SmallButton();
         this.tokenBtn.label = LanResManager.getLanCommonTextWords("贡献令牌");
         addChild(this.tokenBtn);
         this.tokenBtn.x = 378;
         this.tokenBtn.y = 58;
         this.tokenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 27;
            y = 115;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("玩家名字");
         }
         addChild(lb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "label";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.enabled = false;
         sortBtn.x = 82 + sortBtn.width;
         sortBtn.y = 120 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         lb = new FLabel();
         with(lb)
         {
            x = 101;
            y = 115;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(lb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "lv";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 127 + sortBtn.width;
         sortBtn.y = 120 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         lb = new FLabel();
         with(lb)
         {
            x = 147;
            y = 115;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮中职务");
         }
         addChild(lb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "zhiwu";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.enabled = false;
         sortBtn.x = 197 + sortBtn.width;
         sortBtn.y = 120 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         lb = new FLabel();
         with(lb)
         {
            x = 215;
            y = 115;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮主令");
         }
         addChild(lb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "bangzhuling";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 258 + sortBtn.width;
         sortBtn.y = 120 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         lb = new FLabel();
         with(lb)
         {
            x = 273;
            y = 115;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("青龙令");
         }
         addChild(lb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "qinglong";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 316 + sortBtn.width;
         sortBtn.y = 120 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         lb = new FLabel();
         with(lb)
         {
            x = 331;
            y = 115;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("白虎令");
         }
         addChild(lb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "baihu";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 374 + sortBtn.width;
         sortBtn.y = 120 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         lb = new FLabel();
         with(lb)
         {
            x = 390;
            y = 115;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("朱雀令");
         }
         addChild(lb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "zhuque";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 432 + sortBtn.width;
         sortBtn.y = 120 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         lb = new FLabel();
         with(lb)
         {
            x = 447;
            y = 115;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("玄武令");
         }
         addChild(lb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "xuanwu";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 490 + sortBtn.width;
         sortBtn.y = 120 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         lb = new FLabel();
         with(lb)
         {
            x = 522;
            y = 115;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("铜钱");
         }
         addChild(lb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "copper";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 550 + sortBtn.width;
         sortBtn.y = 120 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         lb = new FLabel();
         with(lb)
         {
            x = 581;
            y = 115;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本帮贡献");
         }
         addChild(lb);
         lb.addEventListener(MouseEvent.MOUSE_OVER,this.showTip);
         lb.addEventListener(MouseEvent.MOUSE_OUT,this.showTip);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "lisi";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 634 + sortBtn.width;
         sortBtn.y = 120 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         this.partyList = new FList();
         this.partyList.skin = "list";
         this.partyList.itemRenderer = new PartyFlag_memberListRedner();
         this.partyList.listWidth = 635;
         addChild(this.partyList);
         this.partyList.x = 13;
         this.partyList.y = 134;
         this.partyList.addEventListener(MouseEvent.CLICK,this.onList);
         this.partyList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.partyList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
         this.listScroll = new FVScorllBar(this.partyList,141);
         addChild(this.listScroll);
         this.listScroll.x = 648;
         this.listScroll.y = 134;
         lb = new FLabel();
         with(lb)
         {
            x = 183;
            y = 315;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("个人当前剩余帮贡值");
         }
         addChild(lb);
         bg = Tools.get9GridBitmpByName("inputBg");
         addChild(bg);
         bg.x = 304;
         bg.y = 313;
         bg.width = 80;
         this.contributeValue = new FLabel();
         with(this.contributeValue)
         {
            x = 306;
            y = 315;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "12345";
         }
         addChild(this.contributeValue);
         lb = new FLabel();
         with(lb)
         {
            x = 388;
            y = 315;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "【" + LanResManager.getLanCommonTextWords("个人帮贡可用于学习帮会武学") + "】";
         }
         addChild(lb);
         tf = new TextFormat();
         tf.align = "center";
         this.topBtn = new SecondButton();
         this.topBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.topBtn);
         this.topBtn.x = 280;
         this.topBtn.y = 280;
         this.topBtn.enabled = false;
         this.topBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageTxt = new FTextArea();
         with(this.pageTxt)
         {
            defaultTextFormat = tf;
            x = 332;
            y = 285;
            width = 42;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "1/1";
         }
         addChild(this.pageTxt);
         this.btnBtn = new SecondButton();
         this.btnBtn.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.btnBtn);
         this.btnBtn.x = 372;
         this.btnBtn.y = 280;
         this.btnBtn.enabled = false;
         this.btnBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 570;
            y = 282;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("每页");
         }
         addChild(lb);
         bg = Tools.get9GridBitmpByName("inputBg");
         addChild(bg);
         bg.x = 602;
         bg.y = 280;
         bg.width = 44;
         this.PaginalTxt = new FTextArea();
         with(this.PaginalTxt)
         {
            defaultTextFormat = tf;
            x = 604;
            y = 282;
            width = 40;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "10" + LanResManager.getLanCommonTextWords("项");
         }
         addChild(this.PaginalTxt);
         this.selectBtn3 = new FSimpleButton();
         this.selectBtn3.skin = "bottomButton";
         addChild(this.selectBtn3);
         this.selectBtn3.x = 646;
         this.selectBtn3.y = 280;
         this.selectBtn3.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer3 = new FCanvas();
         this.listContainer3.skin = "backGroud";
         this.listContainer3.width = 64;
         this.listContainer3.height = 85;
         this.listContainer3.x = 601;
         this.listContainer3.y = 300;
         addChild(this.listContainer3);
         this.listContainer3.visible = false;
         this.selectList3 = new FList();
         this.selectList3.skin = "list";
         this.selectList3.listWidth = 56;
         this.selectList3.x = 5;
         this.selectList3.y = 2;
         this.selectList3.itemRenderer = new StrengthenListRender();
         this.selectList3.dataProvider = <list>
														<node label={10 + LanResManager.getLanCommonTextWords("项")} id="10"/>
														<node label={30 + LanResManager.getLanCommonTextWords("项")} id="30"/>
														<node label={50 + LanResManager.getLanCommonTextWords("项")} id="50"/>
														<node label={100 + LanResManager.getLanCommonTextWords("项")} id="100"/>
													</list>;
         this.listContainer3.addChild(this.selectList3);
         this.selectList3.setSelectItemByIndex(0);
         this.selectList3.addEventListener(MouseEvent.CLICK,this.onSelect1);
      }
      
      private function onSelect1(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.selectList3:
               this.PaginalTxt.text = this.selectList3.selectItem.label;
               this.listContainer3.visible = false;
         }
         dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),0]));
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.selectBtn3:
               this.listContainer3.visible = !this.listContainer3.visible;
         }
      }
      
      private function onAddToStage(param1:Event) : void
      {
         dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),0]));
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.copperBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_BTN_CLICK));
               break;
            case this.tokenBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_CONTRIBUTE_TOKEN_BTN_CLICK));
               break;
            case this.topBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),1]));
               break;
            case this.btnBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),2]));
               break;
            case this.kuozhanfuBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_DUIHUANBANGPAIKUOZHANFU_OK));
         }
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(this.partyList.selectItem == null)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_PANEL_SHOW_MENU,"",[this.partyList.selectItem,param1]));
      }
      
      private function onListMouse(param1:MouseEvent) : void
      {
         var _loc2_:FListCellRenderer = null;
         var _loc3_:Object = null;
         var _loc4_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               this.partyList.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target as TextField)
               {
                  _loc2_ = (param1.target as TextField).parent as FListCellRenderer;
                  _loc3_ = _loc2_.data;
                  this.tip.text = _loc3_.label;
                  this.tipCanvas.width = this.tip.width + 4;
                  this.tipCanvas.height = this.tip.height + 4;
                  this.tipCanvas.visible = true;
                  _loc4_ = _loc2_.parent.localToGlobal(new Point(_loc2_.x,_loc2_.y));
                  this.tipCanvas.x = _loc4_.x - this.tipCanvas.width;
                  this.tipCanvas.y = _loc4_.y;
               }
               else
               {
                  this.tipCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OUT:
               this.partyList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               Tools.currentStage.removeChild(this.tipCanvas);
         }
      }
      
      private function onSort(param1:MouseEvent = null) : void
      {
         if(param1)
         {
            this.sortText = param1.target.name;
         }
         var _loc2_:Array = this.partyList.getDataProvider();
         _loc2_.sort(this.sortFun,Array.DESCENDING);
         this.partyList.dataProvider = _loc2_;
         if(_loc2_.length > 0)
         {
            this.partyList.setSelectItemByIndex(0);
         }
         this.listScroll.update();
      }
      
      private function sortFun(param1:Object, param2:Object) : Number
      {
         if(this.sortText == "")
         {
            return 0;
         }
         var _loc3_:int = int(param1[this.sortText]);
         var _loc4_:int = int(param2[this.sortText]);
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      private function showTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               param1.target.addEventListener(MouseEvent.MOUSE_MOVE,this.showTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.tip.htmlText = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帮贡") + "</font></textformat>";
               this.tipCanvas.visible = true;
               this.tipCanvas.width = this.tip.width + 4;
               this.tipCanvas.height = this.tip.height + 4;
               this.tipCanvas.x = mouseX + 15;
               this.tipCanvas.y = mouseY + 25;
               break;
            case MouseEvent.MOUSE_OUT:
               param1.target.removeEventListener(MouseEvent.MOUSE_MOVE,this.showTip);
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
         }
      }
      
      public function setListData(param1:XML, param2:int, param3:int) : void
      {
         this.partyList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.partyList.setSelectItemByIndex(0);
         }
         this.listScroll.update();
         this.pageTxt.text = param3 + "/" + param2;
         if(param3 == 1 && param2 == 1)
         {
            this.btnBtn.enabled = this.topBtn.enabled = false;
         }
         else
         {
            if(param3 == 1)
            {
               this.topBtn.enabled = false;
            }
            else
            {
               this.topBtn.enabled = true;
            }
            if(param3 == param2)
            {
               this.btnBtn.enabled = false;
               this.topBtn.enabled = true;
            }
            else
            {
               this.btnBtn.enabled = true;
            }
         }
      }
      
      public function setPage(param1:int, param2:int) : void
      {
         this.pageTxt.text = param2 + "/" + param1;
      }
      
      public function setContribute(param1:Number) : void
      {
         this.contributeValue.text = param1.toString();
      }
      
      public function setPartyContribute(param1:Array, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc5_:ItemFace = null;
         this.copper.text = param2.toString();
         while(this.tokenContainer.numChildren > 0)
         {
            this.tokenContainer.removeChildAt(0);
         }
         var _loc4_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = new ItemFace(param1[_loc3_] as Goods);
            if(_loc5_.getBaseItem().count == 0)
            {
               _loc5_.filters = Tools.blackWhiteFilter;
            }
            this.tokenContainer.addChild(_loc5_);
            if(_loc3_ != 0)
            {
               _loc5_.x = (_loc3_ - 1) * 46 + 64;
            }
            _loc3_++;
         }
      }
      
      public function showContributeTokenPanel() : Party_contribute_tokenPanel
      {
         if(!this.contributeTokenPanel)
         {
            this.contributeTokenPanel = new Party_contribute_tokenPanel();
            this.contributeTokenPanel.$parent = this;
         }
         this.contributeTokenPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.contributeTokenPanel);
         return this.contributeTokenPanel;
      }
      
      public function showContributeCopperPanel(param1:Number) : void
      {
         if(!this.contributeCopperPanel)
         {
            this.contributeCopperPanel = new Party_contribute_copperPanel();
            this.contributeCopperPanel.$parent = this;
         }
         this.contributeCopperPanel.visible = true;
         this.contributeCopperPanel.setCopper(param1);
         POPWindowManager.showWindow(this.contributeCopperPanel);
      }
   }
}

