package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FAlertEvent;
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
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.shell.view.components.friend.SearchPlayerPanel;
   import com.tgame.shell.view.components.party.ApplicationJoinPartyPanel;
   import com.tgame.shell.view.components.party.InviteJoinPartyPanel;
   import com.tgame.shell.view.components.party.PartyMemberListRender;
   import com.tgame.shell.view.components.party.Party_changeChenghaoPanel;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class Party_memberManagePanel extends FPanel
   {
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_QUALIFICATION:String = "UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_QUALIFICATION";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_MENU:String = "UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_MENU";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_ISAUTO_ACCEPT_INVITE:String = "UI_PARTY_MEMBER_MANAGE_PANEL_ISAUTO_ACCEPT_INVITE";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_ADD_MEMBER:String = "UI_PARTY_MEMBER_MANAGE_PANEL_ADD_MEMBER";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_REMOVE_MEMBER:String = "UI_PARTY_MEMBER_MANAGE_PANEL_REMOVE_MEMBER";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_DISBAND_PARTY:String = "UI_PARTY_MEMBER_MANAGE_PANEL_DISBAND_PARTY";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_EXIT_PARTY:String = "UI_PARTY_MEMBER_MANAGE_PANEL_EXIT_PARTY";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_CHANGE_CHENGHAO:String = "UI_PARTY_MEMBER_MANAGE_PANEL_CHANGE_CHENGHAO";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_PLAYER_CHATTRIBUTE_LOOK:String = "UI_FRIEND_LOOK_INFOBTN_CLICK";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_APPLICATION_ISOK:String = "UI_PARTY_MEMBER_MANAGE_PANEL_APPLICATION_ISOK";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_JOIN_ISOK:String = "UI_PARTY_MEMBER_MANAGE_PANEL_JOIN_ISOK";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_INVITE_JOIN_PARTY:String = "UI_PARTY_MEMBER_MANAGE_PANEL_INVITE_JOIN_PARTY";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_SEARCH:String = "UI_FRIEND_SEARCH_BNT_CLICK";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_PRE_PAGE:String = "UI_FRIEND_GET_PREPAGE";
      
      public static const UI_PARTY_MEMBER_MANAGE_PANEL_NEXT_PAGE:String = "UI_FRIEND_GET_NEXTPAGE";
      
      private var partyList:FList;
      
      private var listScroll:FVScorllBar;
      
      private var PaginalTxt:FTextArea;
      
      private var selectBtn3:FSimpleButton;
      
      private var listContainer3:FCanvas;
      
      private var selectList3:FList;
      
      private var ShowTxt:FTextArea;
      
      private var selectBtn4:FSimpleButton;
      
      private var listContainer4:FCanvas;
      
      private var selectList4:FList;
      
      public var checkBox:FCheckBox;
      
      private var topBtn:SecondButton;
      
      private var btnBtn:SecondButton;
      
      private var pageTxt:FTextArea;
      
      private var addMemberBtn:SecondButton;
      
      private var removeMemberBtn:SecondButton;
      
      private var disbandBtn:SecondButton;
      
      private var exitBtn:SecondButton;
      
      private var searchPanel:SearchPlayerPanel;
      
      private var sortText:String = "";
      
      private var invitePanel:InviteJoinPartyPanel;
      
      private var appplicationPanel:ApplicationJoinPartyPanel;
      
      private var changeChengHaoPanel:Party_changeChenghaoPanel;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function Party_memberManagePanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var fb:FLabel;
         var sortBtn:FSimpleButton;
         var tf:TextFormat;
         var pageContainer:Sprite;
         var lb:FLabel;
         var bg:F9GridBitmap;
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 680;
         height = 380;
         titleText = LanResManager.getLanCommonTextWords("成员信息管理");
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
         }
         this.tipCanvas.addChild(this.tip);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.party.member.manage.ui";
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         fb = new FLabel();
         with(fb)
         {
            x = 35 + 14;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("成员名称");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "label";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.enabled = false;
         sortBtn.x = 88 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 110 + 7;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "lv";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 138 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 156 - 1;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("职务");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "job";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.enabled = false;
         sortBtn.x = 182 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 215 + 1;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮中昵称");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "nickName";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.enabled = false;
         sortBtn.x = 266 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 288 + 18;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("武功层数");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "kungfuLv";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 338 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 360 + 4;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("经脉进度");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "jingmaiLv";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 413 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 434 + 4;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("成就进度");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "chengjiuLv";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 486 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 507;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("城战声望");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "shengwang";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 557 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 580;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本周BOSS");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "boss";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 630 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         this.partyList = new FList();
         this.partyList.skin = "list";
         this.partyList.itemRenderer = new PartyMemberListRender();
         this.partyList.listWidth = 637;
         addChild(this.partyList);
         this.partyList.x = 13;
         this.partyList.y = 33;
         this.partyList.addEventListener(MouseEvent.CLICK,this.onList);
         this.partyList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.partyList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
         this.listScroll = new FVScorllBar(this.partyList,240);
         addChild(this.listScroll);
         this.listScroll.x = 650;
         this.listScroll.y = 33;
         tf = new TextFormat();
         tf.align = "center";
         this.pageTxt = new FTextArea();
         with(this.pageTxt)
         {
            defaultTextFormat = tf;
            x = 322;
            y = panelWidth / 2 - 21;
            width = 42;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "1/1";
         }
         addChild(this.pageTxt);
         this.topBtn = new SecondButton();
         this.topBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.topBtn);
         this.topBtn.x = this.pageTxt.x - this.topBtn.width;
         this.topBtn.y = 315;
         this.topBtn.enabled = false;
         this.topBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.removeMemberBtn = new SecondButton();
         this.removeMemberBtn.label = LanResManager.getLanCommonTextWords("开除出帮");
         this.removeMemberBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("只有帮主和副帮主可以开除成员") + "</font>";
         addChild(this.removeMemberBtn);
         this.removeMemberBtn.x = this.topBtn.x - 76;
         this.removeMemberBtn.y = 315;
         this.removeMemberBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.addMemberBtn = new SecondButton();
         this.addMemberBtn.label = LanResManager.getLanCommonTextWords("添加成员");
         this.addMemberBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("只有帮主和副帮主可以添加成员") + "</font>";
         addChild(this.addMemberBtn);
         this.addMemberBtn.x = this.removeMemberBtn.x - 76;
         this.addMemberBtn.y = 315;
         this.addMemberBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.btnBtn = new SecondButton();
         this.btnBtn.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.btnBtn);
         this.btnBtn.x = this.pageTxt.x + 42;
         this.btnBtn.y = 315;
         this.btnBtn.enabled = false;
         this.btnBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.disbandBtn = new SecondButton();
         this.disbandBtn.label = LanResManager.getLanCommonTextWords("解散帮会");
         this.disbandBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("只有帮主有限解散帮会") + "</font>";
         addChild(this.disbandBtn);
         this.disbandBtn.x = this.btnBtn.x + 76;
         this.disbandBtn.y = 315;
         this.disbandBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.exitBtn = new SecondButton();
         this.exitBtn.label = LanResManager.getLanCommonTextWords("退出本帮");
         addChild(this.exitBtn);
         this.exitBtn.x = this.disbandBtn.x + 100;
         this.exitBtn.y = 315;
         this.exitBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         pageContainer = new Sprite();
         addChild(pageContainer);
         pageContainer.x = 0;
         pageContainer.y = 281;
         lb = new FLabel();
         with(lb)
         {
            x = 0;
            y = 0;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "　　" + LanResManager.getLanCommonTextWords("每页");
         }
         pageContainer.addChild(lb);
         bg = Tools.get9GridBitmpByName("inputBg");
         pageContainer.addChild(bg);
         bg.x = 58;
         bg.width = 44;
         this.PaginalTxt = new FTextArea();
         with(this.PaginalTxt)
         {
            defaultTextFormat = tf;
            x = 60;
            y = 0;
            width = 40;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "10" + LanResManager.getLanCommonTextWords("项");
         }
         pageContainer.addChild(this.PaginalTxt);
         this.selectBtn3 = new FSimpleButton();
         this.selectBtn3.skin = "bottomButton";
         pageContainer.addChild(this.selectBtn3);
         this.selectBtn3.x = 102;
         this.selectBtn3.y = 0;
         this.selectBtn3.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer3 = new FCanvas();
         this.listContainer3.skin = "backGroud";
         this.listContainer3.width = 64;
         this.listContainer3.height = 85;
         this.listContainer3.x = 57;
         this.listContainer3.y = 18;
         pageContainer.addChild(this.listContainer3);
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
         lb = new FLabel();
         with(lb)
         {
            x = 125;
            y = 0;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("显示");
         }
         pageContainer.addChild(lb);
         bg = Tools.get9GridBitmpByName("inputBg");
         pageContainer.addChild(bg);
         bg.x = 157;
         bg.width = 46;
         this.ShowTxt = new FTextArea();
         with(this.ShowTxt)
         {
            defaultTextFormat = tf;
            x = 159;
            y = 0;
            width = 42;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("所有");
         }
         pageContainer.addChild(this.ShowTxt);
         this.selectBtn4 = new FSimpleButton();
         this.selectBtn4.skin = "bottomButton";
         pageContainer.addChild(this.selectBtn4);
         this.selectBtn4.x = 202;
         this.selectBtn4.y = 0;
         this.selectBtn4.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer4 = new FCanvas();
         this.listContainer4.skin = "backGroud";
         this.listContainer4.width = 69;
         this.listContainer4.height = 65;
         this.listContainer4.x = 152;
         this.listContainer4.y = 18;
         pageContainer.addChild(this.listContainer4);
         this.listContainer4.visible = false;
         this.selectList4 = new FList();
         this.selectList4.skin = "list";
         this.selectList4.listWidth = 61;
         this.selectList4.x = 5;
         this.selectList4.y = 2;
         this.selectList4.itemRenderer = new StrengthenListRender();
         this.selectList4.dataProvider = <list>
														<node label={LanResManager.getLanCommonTextWords("所有")} id="2"/>
														<node label={LanResManager.getLanCommonTextWords("在线")} id="1"/>
														<node label={LanResManager.getLanCommonTextWords("离线")} id="0"/>
													</list>;
         this.listContainer4.addChild(this.selectList4);
         this.selectList4.setSelectItemByIndex(0);
         this.selectList4.addEventListener(MouseEvent.CLICK,this.onSelect1);
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 260;
         this.checkBox.y = 282;
         this.checkBox.selectState = true;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         lb = new FLabel();
         with(lb)
         {
            x = 283;
            y = 283;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动同意任意玩家向本帮发出的入帮申请");
         }
         addChild(lb);
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.selectBtn3:
               this.listContainer3.visible = !this.listContainer3.visible;
               break;
            case this.selectBtn4:
               this.listContainer4.visible = !this.listContainer4.visible;
         }
      }
      
      private function onAddToStage(param1:Event) : void
      {
         dispatchEvent(new BaseEvent(UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),int(this.selectList4.selectItem.id),0]));
      }
      
      private function onSelect1(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.selectList3:
               this.PaginalTxt.text = this.selectList3.selectItem.label;
               this.listContainer3.visible = false;
               break;
            case this.selectList4:
               this.ShowTxt.text = this.selectList4.selectItem.label;
               this.listContainer4.visible = false;
         }
         dispatchEvent(new BaseEvent(UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),int(this.selectList4.selectItem.id),0]));
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
      
      private function onList(param1:MouseEvent) : void
      {
         if(this.partyList.selectItem == null)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_MENU,"",[this.partyList.selectItem,param1]));
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
      
      private function onCheck(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_PARTY_MEMBER_MANAGE_PANEL_ISAUTO_ACCEPT_INVITE,"",this.checkBox.selectState));
      }
      
      private function onBtnFun(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         switch(e.target)
         {
            case this.topBtn:
               dispatchEvent(new BaseEvent(UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),int(this.selectList4.selectItem.id),1]));
               break;
            case this.btnBtn:
               dispatchEvent(new BaseEvent(UI_PARTY_MEMBER_MANAGE_PANEL_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),int(this.selectList4.selectItem.id),2]));
               break;
            case this.addMemberBtn:
               dispatchEvent(new BaseEvent(UI_PARTY_MEMBER_MANAGE_PANEL_ADD_MEMBER));
               break;
            case this.removeMemberBtn:
               FAlert.okLabel = LanResManager.getLanCommonTextWords("开除");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(LanResManager.getLanCommonTextWords("您确认开除玩家") + "：" + this.partyList.selectItem.label + "?","",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     dispatchEvent(new BaseEvent(UI_PARTY_MEMBER_MANAGE_PANEL_REMOVE_MEMBER,"",int(partyList.selectItem.id)));
                  }
               });
               break;
            case this.disbandBtn:
               FAlert.okLabel = LanResManager.getLanCommonTextWords("解散");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(LanResManager.getLanCommonTextWords("您确认要解散帮会吗？") + "<br><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("解散后，将无法恢复!") + "</font>","",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     dispatchEvent(new BaseEvent(UI_PARTY_MEMBER_MANAGE_PANEL_DISBAND_PARTY));
                  }
               });
               break;
            case this.exitBtn:
               FAlert.okLabel = LanResManager.getLanCommonTextWords("退出");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(LanResManager.getLanCommonTextWords("您确认要退出帮会吗？") + "\n" + LanResManager.getLanCommonTextWords("退出帮会后将不再享受帮旗带来的属性加成"),"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     dispatchEvent(new BaseEvent(UI_PARTY_MEMBER_MANAGE_PANEL_EXIT_PARTY));
                  }
               });
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setDataProvider(param1:XML, param2:int, param3:int) : void
      {
         this.partyList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.removeMemberBtn.enabled = true;
            this.partyList.setSelectItemByIndex(0);
         }
         else
         {
            this.removeMemberBtn.enabled = false;
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
      
      public function showInvitePanel(param1:int, param2:int, param3:String, param4:String, param5:String, param6:String, param7:String) : void
      {
         if(!this.invitePanel)
         {
            this.invitePanel = new InviteJoinPartyPanel();
            this.invitePanel.$parent = this;
         }
         this.invitePanel.visible = true;
         this.invitePanel.x = (GameConfig.sceneWidth - this.invitePanel.width) / 2;
         this.invitePanel.y = (GameConfig.sceneHeight - this.invitePanel.height) / 2;
         this.invitePanel.setPlayer(param1,param2,param3,param4,param5,param6,param7);
         GameInstance.uiInstance.uiContainer.addChild(this.invitePanel);
      }
      
      public function showApplicationPanel(param1:int, param2:String, param3:String, param4:String, param5:String, param6:String) : void
      {
         if(!this.appplicationPanel)
         {
            this.appplicationPanel = new ApplicationJoinPartyPanel();
            UIEventsRegisterManager.registerUI(this.appplicationPanel,ApplicationJoinPartyPanel);
            this.appplicationPanel.$parent = this;
         }
         this.appplicationPanel.visible = true;
         this.appplicationPanel.x = (GameConfig.sceneWidth - this.appplicationPanel.width) / 2;
         this.appplicationPanel.y = (GameConfig.sceneHeight - this.appplicationPanel.height) / 2;
         this.appplicationPanel.setPlayer(param1,param2,param3,param4,param5,param6);
         GameInstance.uiInstance.uiContainer.addChild(this.appplicationPanel);
      }
      
      public function showChangeChengHaoPanel(param1:int, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String) : void
      {
         if(!this.changeChengHaoPanel)
         {
            this.changeChengHaoPanel = new Party_changeChenghaoPanel();
            this.changeChengHaoPanel.$parent = this;
         }
         this.changeChengHaoPanel.visible = true;
         this.changeChengHaoPanel.x = (GameConfig.sceneWidth - this.changeChengHaoPanel.width) / 2;
         this.changeChengHaoPanel.y = (GameConfig.sceneHeight - this.changeChengHaoPanel.height) / 2;
         this.changeChengHaoPanel.setPlayer(param1,param2,param3,param4,param5,param6,param7);
         GameInstance.uiInstance.uiContainer.addChild(this.changeChengHaoPanel);
      }
      
      public function showSearchPlayerPanel() : void
      {
         if(this.searchPanel == null)
         {
            this.searchPanel = new SearchPlayerPanel();
            this.searchPanel.$parent = this;
            this.searchPanel.type = "INVITE_JOIN_PARTY";
         }
         addChild(this.searchPanel);
         this.searchPanel.visible = true;
         var _loc1_:Point = this.globalToLocal(new Point(Tools.currentStage.stageWidth / 2,Tools.currentStage.stageHeight / 2));
         this.searchPanel.x = _loc1_.x - this.searchPanel.width / 2;
         this.searchPanel.y = _loc1_.y - this.searchPanel.height / 2;
      }
      
      public function setSearchPanelList(param1:XML, param2:int) : void
      {
         this.searchPanel.setList(param1,param2);
      }
   }
}

