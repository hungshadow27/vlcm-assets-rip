package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.Accomplishment.AccomplishmentContrastPanel;
   import com.tgame.shell.view.components.Accomplishment.AccomplishmentContrastSearchPlayerPanel;
   import com.tgame.shell.view.components.Accomplishment.AccomplishmentListRender;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class AccomplishmentPanel extends FPanel
   {
      
      public static const UI_ACCOMPLISHMENT_EMPLOY:String = "UI_ACCOMPLISHMENT_EMPLOY";
      
      public static const UI_ACCOMPLISHMENT_HIDE:String = "UI_ACCOMPLISHMENT_HIDE";
      
      public static const UI_ACCOMPLISHMENT_LEFTNAV:String = "UI_ACCOMPLISHMENT_LEFTNAV";
      
      public static const UI_ACCOMPLISHMENT_REFURBISH:String = "UI_ACCOMPLISHMENT_REFURBISH";
      
      public static const UI_ACCOMPLISHMENT_LISTREFURBISH:String = "UI_ACCOMPLISHMENT_LISTREFURBISH";
      
      public static const UI_ACCOMPLISHMENT_PREVIOUSPAGE:String = "UI_ACCOMPLISHMENT_PREVIOUSPAGE";
      
      public static const UI_ACCOMPLISHMENT_NEXTPAGE:String = "UI_ACCOMPLISHMENT_NEXTPAGE";
      
      public static const UI_CHENGJIU_DUIBI_GENGHUANBTN_CLICK:String = "UI_CHENGJIU_DUIBI_GENGHUANBTN_CLICK";
      
      public static const UI_CHENGJIU_SEARCH_PAGE_NEXT_BTN_CLICK:String = "UI_CHENGJIU_SEARCH_PAGE_NEXT_BTN_CLICK";
      
      public static const UI_CHENGJIU_SEARCH_PAGE_PRE_BTN_CLICK:String = "UI_CHENGJIU_SEARCH_PAGE_PRE_BTN_CLICK";
      
      public static const UI_CHENGJIU_SEARCH_SEARCH_BTN_CLICK:String = "UI_CHENGJIU_SEARCH_SEARCH_BTN_CLICK";
      
      public static const UI_CHENGJIU_SEARCH_START_BTN_CLICK:String = "UI_CHENGJIU_SEARCH_START_BTN_CLICK";
      
      public static const UI_CHENGJIU_SEARCH_LOOK_INFO_BTN_CLICK:String = "UI_CHENGJIU_SEARCH_LOOK_INFO_BTN_CLICK";
      
      public static const UI_CHENGJIU_DUIBI_CLOSE:String = "UI_CHENGJIU_DUIBI_CLOSE";
      
      private var _currentlyPage:int;
      
      private var _listArr1:Array;
      
      private var lb:FLabel;
      
      private var CurrentlyDesignationTxt:FLabel;
      
      private var AcquiredDesignationTxt:FTextArea;
      
      private var selectBtn1:FSimpleButton;
      
      private var Scroll1:FVScorllBar;
      
      private var listContainer1:FCanvas;
      
      private var selectList1:FList;
      
      private var startBtn:SecondButton;
      
      private var concealBtn:SecondButton;
      
      private var cjbbkBtn:SecondButton;
      
      private var TdBtn:SecondButton;
      
      private var JhBtn:SecondButton;
      
      private var QzBtn:SecondButton;
      
      private var SbBtn:SecondButton;
      
      private var YxBtn:SecondButton;
      
      private var KuapintaiBtn:SecondButton;
      
      private var listContainer2:Sprite;
      
      private var selectList2:FList;
      
      private var Scroll2:FVScorllBar;
      
      private var PaginalTxt:FTextArea;
      
      private var selectBtn3:FSimpleButton;
      
      private var listContainer3:FCanvas;
      
      private var selectList3:FList;
      
      private var ShowTxt:FTextArea;
      
      private var selectBtn4:FSimpleButton;
      
      private var listContainer4:FCanvas;
      
      private var selectList4:FList;
      
      private var refurbishBtn:SecondButton;
      
      private var topBtn:SecondButton;
      
      private var btnBtn:SecondButton;
      
      private var pageTxt:FTextArea;
      
      private var chzs1:Bitmap;
      
      private var chzs2:Bitmap;
      
      private var chzs3:Bitmap;
      
      private var chzs4:Bitmap;
      
      private var chzs5:Bitmap;
      
      private var cjzs1:Bitmap;
      
      private var cjzs2:Bitmap;
      
      private var cjzs3:Bitmap;
      
      private var cjzs4:Bitmap;
      
      private var cjzs5:Bitmap;
      
      private var img:Bitmap;
      
      private var XlBar:ColorBar;
      
      private var LjBar:ColorBar;
      
      private var accomplishmentcontrastPanel:AccomplishmentContrastPanel;
      
      private var searchplayerPanel:AccomplishmentContrastSearchPlayerPanel;
      
      private var bg9:F9GridBitmap;
      
      private var ScrollPd1:Boolean = true;
      
      public function AccomplishmentPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var tfalign:TextFormat;
         this._listArr1 = new Array();
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 614;
         height = 455;
         this.titleText = LanResManager.getLanCommonTextWords("成就与称号");
         bg = new Bitmap();
         bg.name = "ui.char.attribute.accomplishment.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onClose);
         this.listContainer2 = new Sprite();
         addChild(this.listContainer2);
         with(this.listContainer2)
         {
            x = 145;
            y = 37;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,453,336);
            graphics.endFill();
         }
         this.selectList2 = new FList();
         this.selectList2.skin = "list";
         this.selectList2.itemRenderer = new AccomplishmentListRender();
         this.selectList2.listWidth = 435;
         this.listContainer2.addChild(this.selectList2);
         this.selectList2.x = 0;
         this.selectList2.y = 0;
         this.Scroll2 = new FVScorllBar(this.listContainer2,336);
         addChild(this.Scroll2);
         this.Scroll2.x = 585;
         this.Scroll2.y = 37;
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 35;
            y = 10;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"当前称号");
         }
         addChild(this.lb);
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 106;
         this.bg9.height = 17;
         this.bg9.x = 96;
         this.bg9.y = 10;
         addChild(this.bg9);
         this.CurrentlyDesignationTxt = new FLabel();
         with(this.CurrentlyDesignationTxt)
         {
            x = 102 - 5;
            y = 11 - 3;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.CurrentlyDesignationTxt);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 213;
            y = 10;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"已获称号");
         }
         addChild(this.lb);
         tfalign = new TextFormat();
         tfalign.align = "center";
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 126;
         this.bg9.height = 17;
         this.bg9.x = 275;
         this.bg9.y = 10;
         addChild(this.bg9);
         this.AcquiredDesignationTxt = new FTextArea();
         with(this.AcquiredDesignationTxt)
         {
            x = 281 - 5;
            y = 11 - 3;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.AcquiredDesignationTxt);
         this.selectBtn1 = new FSimpleButton();
         this.selectBtn1.skin = "bottomButton";
         addChild(this.selectBtn1);
         this.selectBtn1.x = 383;
         this.selectBtn1.y = 10;
         this.selectBtn1.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer1 = new FCanvas();
         this.listContainer1.skin = "backGroud";
         this.listContainer1.width = 127;
         this.listContainer1.height = 125;
         this.listContainer1.x = 275;
         this.listContainer1.y = 28;
         addChild(this.listContainer1);
         this.listContainer1.visible = false;
         this.selectList1 = new FList();
         this.selectList1.skin = "list";
         this.selectList1.listWidth = 102;
         this.selectList1.x = 5;
         this.selectList1.y = 2;
         this.selectList1.itemRenderer = new StrengthenListRender();
         this.listContainer1.addChild(this.selectList1);
         this.selectList1.addEventListener(MouseEvent.CLICK,this.onSelect1);
         this.Scroll1 = new FVScorllBar(this.listContainer1,125);
         addChild(this.Scroll1);
         this.Scroll1.x = 385;
         this.Scroll1.y = 28;
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("启用");
         addChild(this.startBtn);
         this.startBtn.x = 405;
         this.startBtn.y = 9;
         this.startBtn.enabled = false;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.concealBtn = new SecondButton();
         this.concealBtn.label = LanResManager.getLanCommonTextWords("隐藏");
         addChild(this.concealBtn);
         this.concealBtn.x = 455;
         this.concealBtn.y = 9;
         this.concealBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.cjbbkBtn = new SecondButton();
         this.cjbbkBtn.label = LanResManager.getLanCommonTextWords("成就比比看");
         addChild(this.cjbbkBtn);
         this.cjbbkBtn.x = 505;
         this.cjbbkBtn.y = 9;
         this.cjbbkBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.TdBtn = new SecondButton();
         this.TdBtn.label = LanResManager.getLanCommonTextWords("天道酬勤");
         addChild(this.TdBtn);
         this.TdBtn.x = 40;
         this.TdBtn.y = 47;
         this.TdBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.TdBtn.visible = false;
         this.JhBtn = new SecondButton();
         this.JhBtn.label = LanResManager.getLanCommonTextWords("江湖历练");
         addChild(this.JhBtn);
         this.JhBtn.x = 40;
         this.JhBtn.y = 47;
         this.JhBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.QzBtn = new SecondButton();
         this.QzBtn.label = LanResManager.getLanCommonTextWords("强者之路");
         addChild(this.QzBtn);
         this.QzBtn.x = 40;
         this.QzBtn.y = 75;
         this.QzBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.SbBtn = new SecondButton();
         this.SbBtn.label = LanResManager.getLanCommonTextWords("神兵神骑");
         addChild(this.SbBtn);
         this.SbBtn.x = 40;
         this.SbBtn.y = 103;
         this.SbBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.YxBtn = new SecondButton();
         this.YxBtn.label = LanResManager.getLanCommonTextWords("浴血沙场");
         addChild(this.YxBtn);
         this.YxBtn.x = 40;
         this.YxBtn.y = 131;
         this.YxBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 32;
            y = 200;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"获得称号个数");
         }
         addChild(this.lb);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 32;
            y = 236;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"累计成就点数");
         }
         addChild(this.lb);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 19;
            y = 284;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"每点成就=1点血量");
         }
         addChild(this.lb);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 19;
            y = 298;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"成就系统已加成血量");
         }
         addChild(this.lb);
         this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img);
         this.img.x = 13;
         this.img.y = 315;
         this.XlBar = new ColorBar(5,95,11);
         addChild(this.XlBar);
         this.XlBar.x = 28;
         this.XlBar.y = 318;
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 19;
            y = 335;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"每点成就=1个礼金");
         }
         addChild(this.lb);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 19;
            y = 349;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"成就系统已奖励礼金");
         }
         addChild(this.lb);
         this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img);
         this.img.x = 13;
         this.img.y = 366;
         this.LjBar = new ColorBar(5,95,11);
         addChild(this.LjBar);
         this.LjBar.x = 28;
         this.LjBar.y = 369;
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 15;
            y = 389;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"成就激活自动获得");
         }
         addChild(this.lb);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 150;
            y = 388;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("每页");
         }
         addChild(this.lb);
         this.PaginalTxt = new FTextArea();
         with(this.PaginalTxt)
         {
            defaultTextFormat = tfalign;
            x = 180;
            y = 386;
            width = 40;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("3项");
         }
         addChild(this.PaginalTxt);
         this.selectBtn3 = new FSimpleButton();
         this.selectBtn3.skin = "bottomButton";
         addChild(this.selectBtn3);
         this.selectBtn3.x = 222;
         this.selectBtn3.y = 386;
         this.selectBtn3.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer3 = new FCanvas();
         this.listContainer3.skin = "backGroud";
         this.listContainer3.width = 64;
         this.listContainer3.height = 85;
         this.listContainer3.x = 177;
         this.listContainer3.y = 404;
         addChild(this.listContainer3);
         this.listContainer3.visible = false;
         this.selectList3 = new FList();
         this.selectList3.skin = "list";
         this.selectList3.listWidth = 56;
         this.selectList3.x = 5;
         this.selectList3.y = 2;
         this.selectList3.itemRenderer = new StrengthenListRender();
         this.selectList3.dataProvider = <list>
														<node label={LanResManager.getLanCommonTextWords("3项")} id="3"/>
														<node label={LanResManager.getLanCommonTextWords("6项")} id="6"/>
														<node label={LanResManager.getLanCommonTextWords("9项")} id="9"/>
														<node label={LanResManager.getLanCommonTextWords("12项")} id="12"/>
													</list>;
         this.listContainer3.addChild(this.selectList3);
         this.selectList3.addEventListener(MouseEvent.CLICK,this.onSelect1);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 245;
            y = 388;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("显示");
         }
         addChild(this.lb);
         this.ShowTxt = new FTextArea();
         with(this.ShowTxt)
         {
            defaultTextFormat = tfalign;
            x = 279;
            y = 386;
            width = 42;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("所有");
         }
         addChild(this.ShowTxt);
         this.selectBtn4 = new FSimpleButton();
         this.selectBtn4.skin = "bottomButton";
         addChild(this.selectBtn4);
         this.selectBtn4.x = 322;
         this.selectBtn4.y = 386;
         this.selectBtn4.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer4 = new FCanvas();
         this.listContainer4.skin = "backGroud";
         this.listContainer4.width = 69;
         this.listContainer4.height = 65;
         this.listContainer4.x = 272;
         this.listContainer4.y = 404;
         addChild(this.listContainer4);
         this.listContainer4.visible = false;
         this.selectList4 = new FList();
         this.selectList4.skin = "list";
         this.selectList4.listWidth = 61;
         this.selectList4.x = 5;
         this.selectList4.y = 2;
         this.selectList4.itemRenderer = new StrengthenListRender();
         this.selectList4.dataProvider = <list>
														<node label={LanResManager.getLanCommonTextWords("所有")} id="1"/>
														<node label={LanResManager.getLanCommonTextWords("已达成")} id="2"/>
														<node label={LanResManager.getLanCommonTextWords("未达成")} id="3"/>
													</list>;
         this.listContainer4.addChild(this.selectList4);
         this.selectList4.addEventListener(MouseEvent.CLICK,this.onSelect1);
         this.refurbishBtn = new SecondButton();
         this.refurbishBtn.label = LanResManager.getLanCommonTextWords("刷新");
         addChild(this.refurbishBtn);
         this.refurbishBtn.x = 350;
         this.refurbishBtn.y = 385;
         this.refurbishBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.topBtn = new SecondButton();
         this.topBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.topBtn);
         this.topBtn.x = 430;
         this.topBtn.y = 385;
         this.topBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.pageTxt = new FTextArea();
         with(this.pageTxt)
         {
            defaultTextFormat = tfalign;
            x = 482;
            y = 388;
            width = 42;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.pageTxt);
         this.btnBtn = new SecondButton();
         this.btnBtn.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.btnBtn);
         this.btnBtn.x = 520;
         this.btnBtn.y = 385;
         this.btnBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         addEventListener(UI_CHENGJIU_DUIBI_GENGHUANBTN_CLICK,this.aa1);
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showSearch();
      }
      
      private function onBtnFun(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         switch(param1.target)
         {
            case this.startBtn:
               if(this.selectList1.selectItem == null)
               {
                  _loc2_ = -1;
               }
               else
               {
                  _loc2_ = int(this.selectList1.selectItem.data);
               }
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_EMPLOY,"",_loc2_));
               break;
            case this.concealBtn:
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_HIDE));
               break;
            case this.cjbbkBtn:
               this.showDuiBi();
               break;
            case this.TdBtn:
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_LEFTNAV,"",1));
               break;
            case this.JhBtn:
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_LEFTNAV,"",2));
               break;
            case this.QzBtn:
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_LEFTNAV,"",3));
               break;
            case this.SbBtn:
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_LEFTNAV,"",4));
               break;
            case this.YxBtn:
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_LEFTNAV,"",5));
               break;
            case this.KuapintaiBtn:
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_LEFTNAV,"",6));
            case this.refurbishBtn:
               _loc3_ = 3;
               if(this.selectList3.selectItem == null)
               {
                  _loc3_ = 3;
               }
               else
               {
                  _loc3_ = int(this.selectList3.selectItem.id);
               }
               _loc4_ = 1;
               if(this.selectList4.selectItem == null)
               {
                  _loc4_ = 1;
               }
               else
               {
                  _loc4_ = int(this.selectList4.selectItem.id);
               }
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_REFURBISH,"",{
                  "meiye":_loc3_,
                  "xianshi":_loc4_
               }));
               break;
            case this.topBtn:
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_PREVIOUSPAGE,"",this._currentlyPage - 1));
               break;
            case this.btnBtn:
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_NEXTPAGE,"",this._currentlyPage + 1));
         }
      }
      
      private function onSelect1(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         switch(param1.currentTarget)
         {
            case this.selectList1:
               this.startBtn.enabled = true;
               this.AcquiredDesignationTxt.text = this.selectList1.selectItem.label;
               this.listContainer1.visible = false;
               this.Scroll1.visible = false;
               break;
            case this.selectList3:
               this.PaginalTxt.text = this.selectList3.selectItem.label;
               this.listContainer3.visible = false;
               _loc2_ = 3;
               if(this.selectList3.selectItem == null)
               {
                  _loc2_ = 3;
               }
               else
               {
                  _loc2_ = int(this.selectList3.selectItem.id);
               }
               _loc3_ = 1;
               if(this.selectList4.selectItem == null)
               {
                  _loc3_ = 1;
               }
               else
               {
                  _loc3_ = int(this.selectList4.selectItem.id);
               }
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_LISTREFURBISH,"",{
                  "meiye":_loc2_,
                  "xianshi":_loc3_
               }));
               break;
            case this.selectList4:
               this.ShowTxt.text = this.selectList4.selectItem.label;
               this.listContainer4.visible = false;
               _loc4_ = 3;
               if(this.selectList3.selectItem == null)
               {
                  _loc4_ = 3;
               }
               else
               {
                  _loc4_ = int(this.selectList3.selectItem.id);
               }
               _loc5_ = 1;
               if(this.selectList4.selectItem == null)
               {
                  _loc5_ = 1;
               }
               else
               {
                  _loc5_ = int(this.selectList4.selectItem.id);
               }
               dispatchEvent(new BaseEvent(UI_ACCOMPLISHMENT_LISTREFURBISH,"",{
                  "meiye":_loc4_,
                  "xianshi":_loc5_
               }));
         }
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.selectBtn1:
               this.listContainer1.visible = !this.listContainer1.visible;
               if(this.ScrollPd1)
               {
                  this.Scroll1.update();
                  this.ScrollPd1 = false;
               }
               if(this._listArr1.length > 6)
               {
                  this.Scroll1.visible = this.listContainer1.visible;
               }
               else
               {
                  this.Scroll1.visible = false;
               }
               break;
            case this.selectBtn3:
               this.listContainer3.visible = !this.listContainer3.visible;
               break;
            case this.selectBtn4:
               this.listContainer4.visible = !this.listContainer4.visible;
         }
      }
      
      private function onClose(param1:*) : void
      {
         if(this.searchplayerPanel != null && this.searchplayerPanel.parent != null)
         {
            this.searchplayerPanel.onClose();
         }
         if(this.accomplishmentcontrastPanel != null && this.accomplishmentcontrastPanel.parent != null)
         {
            this.accomplishmentcontrastPanel.onClose();
         }
         if(parent != null && param1 is FCloseEvent)
         {
            parent.removeChild(this);
         }
      }
      
      private function ReturnNmber(param1:int) : String
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case 0:
               _loc2_ = "ui.char.attribute.accomplishment.number.zero";
               break;
            case 1:
               _loc2_ = "ui.char.attribute.accomplishment.number.one";
               break;
            case 2:
               _loc2_ = "ui.char.attribute.accomplishment.number.two";
               break;
            case 3:
               _loc2_ = "ui.char.attribute.accomplishment.number.three";
               break;
            case 4:
               _loc2_ = "ui.char.attribute.accomplishment.number.four";
               break;
            case 5:
               _loc2_ = "ui.char.attribute.accomplishment.number.five";
               break;
            case 6:
               _loc2_ = "ui.char.attribute.accomplishment.number.six";
               break;
            case 7:
               _loc2_ = "ui.char.attribute.accomplishment.number.seven";
               break;
            case 8:
               _loc2_ = "ui.char.attribute.accomplishment.number.eight";
               break;
            case 9:
               _loc2_ = "ui.char.attribute.accomplishment.number.nine";
         }
         return _loc2_;
      }
      
      public function SetInitializeContent(param1:Array) : void
      {
         this.selectList2.dataProvider = param1;
         this.Scroll2.update();
      }
      
      public function SetInitializeUi(param1:String, param2:Array, param3:int, param4:int) : void
      {
         if(param1 == "")
         {
            this.concealBtn.enabled = false;
         }
         else
         {
            this.concealBtn.enabled = true;
         }
         this.AcquiredDesignationTxt.text = "";
         this.startBtn.enabled = false;
         this.CurrentlyDesignationTxt.text = String(param1);
         this.selectList1.dataProvider = param2;
         if(this.ScrollPd1 == false)
         {
            if(param2.length > 6)
            {
               this.Scroll1.update();
               this.Scroll1.visible = this.listContainer1.visible;
            }
            else
            {
               this.Scroll1.update();
            }
         }
         this._listArr1 = param2;
         this.listContainer1.height = param2.length * 20 + 25;
         if(this.chzs1 != null)
         {
            removeChild(this.chzs1);
         }
         this.chzs1 = StaticValue.getBitmapByClassName(this.ReturnNmber(int(param3 / 10000)));
         addChild(this.chzs1);
         this.chzs1.x = 35;
         this.chzs1.y = 215;
         if(this.chzs2 != null)
         {
            removeChild(this.chzs2);
         }
         this.chzs2 = StaticValue.getBitmapByClassName(this.ReturnNmber(int(int(param3 % 10000) / 1000)));
         addChild(this.chzs2);
         this.chzs2.x = 49;
         this.chzs2.y = 215;
         if(this.chzs3 != null)
         {
            removeChild(this.chzs3);
         }
         this.chzs3 = StaticValue.getBitmapByClassName(this.ReturnNmber(int(int(int(param3 % 1000) / 100))));
         addChild(this.chzs3);
         this.chzs3.x = 63;
         this.chzs3.y = 215;
         if(this.chzs4 != null)
         {
            removeChild(this.chzs4);
         }
         this.chzs4 = StaticValue.getBitmapByClassName(this.ReturnNmber(int(int(param3 % 100) / 10)));
         addChild(this.chzs4);
         this.chzs4.x = 77;
         this.chzs4.y = 215;
         if(this.chzs5 != null)
         {
            removeChild(this.chzs5);
         }
         this.chzs5 = StaticValue.getBitmapByClassName(this.ReturnNmber(int(param3 % 10)));
         addChild(this.chzs5);
         this.chzs5.x = 91;
         this.chzs5.y = 215;
         if(this.cjzs1 != null)
         {
            removeChild(this.cjzs1);
         }
         this.cjzs1 = StaticValue.getBitmapByClassName(this.ReturnNmber(int(param4 / 10000)));
         addChild(this.cjzs1);
         this.cjzs1.x = 35;
         this.cjzs1.y = 252;
         if(this.cjzs2 != null)
         {
            removeChild(this.cjzs2);
         }
         this.cjzs2 = StaticValue.getBitmapByClassName(this.ReturnNmber(int(int(param4 % 10000) / 1000)));
         addChild(this.cjzs2);
         this.cjzs2.x = 49;
         this.cjzs2.y = 252;
         if(this.cjzs3 != null)
         {
            removeChild(this.cjzs3);
         }
         this.cjzs3 = StaticValue.getBitmapByClassName(this.ReturnNmber(int(int(param4 % 1000) / 100)));
         addChild(this.cjzs3);
         this.cjzs3.x = 63;
         this.cjzs3.y = 252;
         if(this.cjzs4 != null)
         {
            removeChild(this.cjzs4);
         }
         this.cjzs4 = StaticValue.getBitmapByClassName(this.ReturnNmber(int(int(param4 % 100) / 10)));
         addChild(this.cjzs4);
         this.cjzs4.x = 77;
         this.cjzs4.y = 252;
         if(this.cjzs5 != null)
         {
            removeChild(this.cjzs5);
         }
         this.cjzs5 = StaticValue.getBitmapByClassName(this.ReturnNmber(int(param4 % 10)));
         addChild(this.cjzs5);
         this.cjzs5.x = 91;
         this.cjzs5.y = 252;
      }
      
      public function SetPage(param1:int, param2:int) : void
      {
         if(param1 == 1)
         {
            this.topBtn.enabled = false;
         }
         else
         {
            this.topBtn.enabled = true;
         }
         if(param1 == param2)
         {
            this.btnBtn.enabled = false;
         }
         else
         {
            this.btnBtn.enabled = true;
         }
         this._currentlyPage = param1;
         this.pageTxt.text = String(param1 + "/" + param2);
      }
      
      public function HideBtnFun() : void
      {
         this.CurrentlyDesignationTxt.text = "";
         this.concealBtn.enabled = false;
      }
      
      public function startBtnFun(param1:String) : void
      {
         this.CurrentlyDesignationTxt.text = param1;
         this.concealBtn.enabled = true;
      }
      
      public function SetInitializeBar(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.XlBar.setValue(param1,param2);
         this.LjBar.setValue(param3,param4);
      }
      
      public function setSearchName(param1:String) : void
      {
         this.searchplayerPanel.setSearchName(param1);
      }
      
      public function setList(param1:XML, param2:int) : void
      {
         this.searchplayerPanel.setList(param1,param2);
      }
      
      public function SetInitializeContentRight(param1:Array, param2:String, param3:int, param4:int) : void
      {
         if(this.accomplishmentcontrastPanel)
         {
            this.accomplishmentcontrastPanel.SetInitializeContentRight(param1,param2,param3,param4);
         }
      }
      
      public function showSearch() : void
      {
         if(!this.searchplayerPanel)
         {
            this.searchplayerPanel = new AccomplishmentContrastSearchPlayerPanel();
            this.searchplayerPanel.$parent = this;
         }
         this.searchplayerPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.searchplayerPanel);
         this.searchplayerPanel.x = (GameConfig.sceneWidth - this.searchplayerPanel.width) / 2;
         this.searchplayerPanel.y = (GameConfig.sceneHeight - this.searchplayerPanel.height) / 2;
      }
      
      public function showDuiBi() : void
      {
         if(!this.accomplishmentcontrastPanel)
         {
            this.accomplishmentcontrastPanel = new AccomplishmentContrastPanel();
            this.accomplishmentcontrastPanel.$parent = this;
            this.SetInitializeContentRight([],"",0,0);
         }
         if(!this.accomplishmentcontrastPanel.visible)
         {
            this.SetInitializeContentRight([],"",0,0);
         }
         this.accomplishmentcontrastPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.accomplishmentcontrastPanel);
         this.accomplishmentcontrastPanel.x = this.x + 614;
         this.accomplishmentcontrastPanel.y = this.y;
      }
      
      public function showPingtaiZhanyi() : void
      {
         if(this.KuapintaiBtn == null)
         {
            this.KuapintaiBtn = new SecondButton();
            this.KuapintaiBtn.label = LanResManager.getLanCommonTextWords("平台战役");
            addChild(this.KuapintaiBtn);
            this.KuapintaiBtn.x = 40;
            this.KuapintaiBtn.y = 159;
            this.KuapintaiBtn.visible = false;
            this.KuapintaiBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         }
         this.KuapintaiBtn.visible = GameState["gongneng1001"];
      }
   }
}

