package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
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
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.party.PartyListRender;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class PartyListPanel extends FPanel
   {
      
      public static const UI_PARTYPANEL_PARTYLIST_SHOW_QUALIFICATION:String = "UI_PARTYPANEL_PARTYLIST_SHOW_QUALIFICATION";
      
      public static const UI_PARTYPANEL_PARTYLIST_ISAUTO_ACCEPT_INVITE:String = "UI_PARTYPANEL_PARTYLIST_ISAUTO_ACCEPT_INVITE";
      
      public static const UI_PARTYPANEL_PARTYLIST_CREATE_PARTY:String = "UI_PARTYPANEL_PARTYLIST_CREATE_PARTY";
      
      public static const UI_PARTYPANEL_PARTYLIST_PARTY_APPLICATION:String = "UI_PARTYPANEL_PARTYLIST_PARTY_APPLICATION";
      
      public static const UI_PARTYPANEL_PARTY_XIANGYANG_SHOW:String = "UI_PARTYPANEL_PARTY_XIANGYANG_SHOW";
      
      public static const UI_PARTYPANEL_PARTYLIST_SHOW_MENU:String = "UI_PARTYPANEL_PARTYLIST_SHOW_MENU";
      
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
      
      private var createBtn:SecondButton;
      
      private var topBtn:SecondButton;
      
      private var btnBtn:SecondButton;
      
      private var pageTxt:FTextArea;
      
      private var applicationBtn:SecondButton;
      
      private var xiangYangBtn:SecondButton;
      
      private var sortText:String = "";
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function PartyListPanel()
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
         titleText = LanResManager.getLanCommonTextWords("帮会");
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
         img.name = "ui.party.party.list.ui";
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         fb = new FLabel();
         with(fb)
         {
            x = 30;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮会名称");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "label";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.enabled = false;
         sortBtn.x = 82 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 124;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("现任帮主");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "bangzhu";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         sortBtn.enabled = false;
         addChild(sortBtn);
         sortBtn.x = 175 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 203;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("门派");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "setupID";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 238 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 272;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮中人数");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "memberTotal";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 320 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 352;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级总和");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "levelTotal";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 404 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 448;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮旗等级");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "flagLevel";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 512 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         fb = new FLabel();
         with(fb)
         {
            x = 546;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本周击杀BOSS数");
         }
         addChild(fb);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "bossTotal";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 635 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         this.partyList = new FList();
         this.partyList.skin = "list";
         this.partyList.itemRenderer = new PartyListRender();
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
         this.createBtn = new SecondButton();
         this.createBtn.label = LanResManager.getLanCommonTextWords("创建帮会");
         addChild(this.createBtn);
         this.createBtn.x = 138;
         this.createBtn.y = 315;
         this.createBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.topBtn = new SecondButton();
         this.topBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.topBtn);
         this.topBtn.x = 226;
         this.topBtn.y = 315;
         this.topBtn.enabled = false;
         this.topBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.pageTxt = new FTextArea();
         with(this.pageTxt)
         {
            defaultTextFormat = tf;
            x = 278;
            y = 318;
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
         this.btnBtn.x = 320;
         this.btnBtn.y = 315;
         this.btnBtn.enabled = false;
         this.btnBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.applicationBtn = new SecondButton();
         this.applicationBtn.label = LanResManager.getLanCommonTextWords("申请入帮");
         this.applicationBtn.enabled = false;
         addChild(this.applicationBtn);
         this.applicationBtn.x = 396;
         this.applicationBtn.y = 315;
         this.applicationBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.xiangYangBtn = new SecondButton();
         this.xiangYangBtn.label = LanResManager.getLanCommonTextWords("襄阳归属");
         addChild(this.xiangYangBtn);
         this.xiangYangBtn.x = 484;
         this.xiangYangBtn.y = 315;
         this.xiangYangBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         pageContainer = new Sprite();
         addChild(pageContainer);
         pageContainer.x = 24;
         pageContainer.y = 281;
         lb = new FLabel();
         with(lb)
         {
            x = 0;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("每页");
         }
         pageContainer.addChild(lb);
         bg = Tools.get9GridBitmpByName("inputBg");
         pageContainer.addChild(bg);
         bg.x = 32;
         bg.width = 44;
         this.PaginalTxt = new FTextArea();
         with(this.PaginalTxt)
         {
            defaultTextFormat = tf;
            x = 34;
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
         this.selectBtn3.x = 76;
         this.selectBtn3.y = 1;
         this.selectBtn3.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer3 = new FCanvas();
         this.listContainer3.skin = "backGroud";
         this.listContainer3.width = 64;
         this.listContainer3.height = 85;
         this.listContainer3.x = 31;
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
            x = 99;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("显示");
         }
         pageContainer.addChild(lb);
         bg = Tools.get9GridBitmpByName("inputBg");
         pageContainer.addChild(bg);
         bg.x = 130;
         bg.width = 80;
         this.ShowTxt = new FTextArea();
         with(this.ShowTxt)
         {
            defaultTextFormat = tf;
            x = 132;
            y = 0;
            width = 76;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("所有帮会");
         }
         pageContainer.addChild(this.ShowTxt);
         this.selectBtn4 = new FSimpleButton();
         this.selectBtn4.skin = "bottomButton";
         pageContainer.addChild(this.selectBtn4);
         this.selectBtn4.x = 210;
         this.selectBtn4.y = 1;
         this.selectBtn4.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer4 = new FCanvas();
         this.listContainer4.skin = "backGroud";
         this.listContainer4.width = 99;
         this.listContainer4.height = 65;
         this.listContainer4.x = 130;
         this.listContainer4.y = 18;
         pageContainer.addChild(this.listContainer4);
         this.listContainer4.visible = false;
         this.selectList4 = new FList();
         this.selectList4.skin = "list";
         this.selectList4.listWidth = 89;
         this.selectList4.x = 5;
         this.selectList4.y = 2;
         this.selectList4.itemRenderer = new StrengthenListRender();
         this.selectList4.dataProvider = <list>
														<node label={LanResManager.getLanCommonTextWords("所有帮会")} id="0"/>
														<node label={LanResManager.getLanCommonTextWords("自动招人帮会")} id="1"/>
														<node label={LanResManager.getLanCommonTextWords("招人验证帮会")} id="2"/>
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
            text = LanResManager.getLanCommonTextWords("自动同意任意帮主向本人发出的入帮邀请");
         }
         addChild(lb);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),int(this.selectList4.selectItem.id),0]));
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTYLIST_ISAUTO_ACCEPT_INVITE,"",this.checkBox.selectState));
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(this.partyList.selectItem == null)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTYLIST_SHOW_MENU,"",[this.partyList.selectItem,param1]));
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
         dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),int(this.selectList4.selectItem.id),0]));
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
      
      private function onBtnFun(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.topBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),int(this.selectList4.selectItem.id),1]));
               break;
            case this.btnBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[int(this.selectList3.selectItem.id),int(this.selectList4.selectItem.id),2]));
               break;
            case this.createBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTYLIST_CREATE_PARTY));
               break;
            case this.applicationBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTYLIST_PARTY_APPLICATION,"",int(this.partyList.selectItem.id)));
               break;
            case this.xiangYangBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTY_XIANGYANG_SHOW));
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
            this.applicationBtn.enabled = true;
            this.partyList.setSelectItemByIndex(0);
         }
         else
         {
            this.applicationBtn.enabled = false;
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
   }
}

