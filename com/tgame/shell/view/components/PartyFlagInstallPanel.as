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
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.party.PartyFlagInstallListRender;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class PartyFlagInstallPanel extends FPanel
   {
      
      public static const UI_PARTYFLAGINSTALLPANEL_PARTYLIST_SHOW_QUALIFICATION:String = "UI_PARTYFLAGINSTALLPANEL_PARTYLIST_SHOW_QUALIFICATION";
      
      public static const UI_PARTYFLAGINSTALLPANEL_FIX_FLAG:String = "UI_PARTYFLAGINSTALLPANEL_FIX_FLAG";
      
      public static const UI_PARTYFLAGINSTALLPANEL_RENOVATE:String = "UI_PARTYFLAGINSTALLPANEL_RENOVATE";
      
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
      
      private var topBtn:SecondButton;
      
      private var btnBtn:SecondButton;
      
      private var pageTxt:FTextArea;
      
      private var fixBtn:SecondButton;
      
      private var renovateBtn:SecondButton;
      
      private var point:FLabel;
      
      private var flagID:int;
      
      private var otherFlag:MovieClip;
      
      private var flag:MovieClip;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function PartyFlagInstallPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         var fb:FLabel;
         var pageContainer:Sprite;
         var lb:FLabel;
         var bg:F9GridBitmap;
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 680;
         height = 379;
         titleText = LanResManager.getLanCommonTextWords("帮旗安插");
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
         img.name = "ui.party.flag.fix.ui";
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         tf = new TextFormat();
         tf.align = "center";
         fb = new FLabel();
         with(fb)
         {
            x = 34;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("地图名字");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 120;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("坐标");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 182;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("旗帜名称");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 266;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 327;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("所属帮会");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 424;
            y = 12;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮旗生命");
         }
         addChild(fb);
         this.partyList = new FList();
         this.partyList.skin = "list";
         this.partyList.itemRenderer = new PartyFlagInstallListRender();
         this.partyList.listWidth = 485;
         addChild(this.partyList);
         this.partyList.x = 13;
         this.partyList.y = 34;
         this.partyList.addEventListener(MouseEvent.CLICK,this.onList);
         this.partyList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.partyList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
         this.listScroll = new FVScorllBar(this.partyList,242);
         addChild(this.listScroll);
         this.listScroll.x = 498;
         this.listScroll.y = 34;
         pageContainer = new Sprite();
         addChild(pageContainer);
         pageContainer.x = 0;
         pageContainer.y = 314;
         lb = new FLabel();
         with(lb)
         {
            x = 0;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("　　显示");
         }
         pageContainer.addChild(lb);
         bg = Tools.get9GridBitmpByName("inputBg");
         pageContainer.addChild(bg);
         bg.x = 58;
         bg.width = 44;
         this.ShowTxt = new FTextArea();
         with(this.ShowTxt)
         {
            defaultTextFormat = tf;
            x = 60;
            y = 2;
            width = 40;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("所有");
         }
         pageContainer.addChild(this.ShowTxt);
         this.selectBtn4 = new FSimpleButton();
         this.selectBtn4.skin = "bottomButton";
         pageContainer.addChild(this.selectBtn4);
         this.selectBtn4.x = 102;
         this.selectBtn4.y = 0;
         this.selectBtn4.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer4 = new FCanvas();
         this.listContainer4.skin = "backGroud";
         this.listContainer4.width = 69;
         this.listContainer4.height = 87;
         this.listContainer4.x = 57;
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
														<node label={LanResManager.getLanCommonTextWords("所有")} id="0"/>
														<node label={LanResManager.getLanCommonTextWords("本帮")} id="1"/>
														<node label={LanResManager.getLanCommonTextWords("他帮")} id="2"/>
														<node label={LanResManager.getLanCommonTextWords("空位")} id="3"/>
													</list>;
         this.listContainer4.addChild(this.selectList4);
         this.selectList4.setSelectItemByIndex(0);
         this.selectList4.addEventListener(MouseEvent.CLICK,this.onSelect1);
         this.fixBtn = new SecondButton();
         this.fixBtn.label = LanResManager.getLanCommonTextWords("安插本帮帮旗");
         this.fixBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"安插帮旗") + "</font>";
         addChild(this.fixBtn);
         this.fixBtn.x = 234;
         this.fixBtn.y = 313;
         this.fixBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.renovateBtn = new SecondButton();
         this.renovateBtn.label = LanResManager.getLanCommonTextWords("修复帮旗血量");
         this.renovateBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"安插帮旗2") + "</font>";
         addChild(this.renovateBtn);
         this.renovateBtn.x = 342;
         this.renovateBtn.y = 313;
         this.renovateBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 525;
            y = 316;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本帮安插") + "：";
         }
         addChild(lb);
         bg = Tools.get9GridBitmpByName("inputBg");
         addChild(bg);
         bg.x = 582;
         bg.y = 314;
         bg.width = 68;
         this.point = new FLabel();
         with(this.point)
         {
            x = 589;
            y = 316;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "100,200";
         }
         addChild(this.point);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         dispatchEvent(new BaseEvent(UI_PARTYFLAGINSTALLPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[1000,int(this.selectList4.selectItem.id),0]));
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
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
         dispatchEvent(new BaseEvent(UI_PARTYFLAGINSTALLPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[1000,int(this.selectList4.selectItem.id),0]));
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
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.topBtn:
               if(this.selectList3.selectItem != null && this.selectList4.selectItem != null)
               {
                  dispatchEvent(new BaseEvent(UI_PARTYFLAGINSTALLPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[1000,int(this.selectList4.selectItem.id),1]));
               }
               break;
            case this.btnBtn:
               if(this.selectList3.selectItem != null && this.selectList4.selectItem != null)
               {
                  dispatchEvent(new BaseEvent(UI_PARTYFLAGINSTALLPANEL_PARTYLIST_SHOW_QUALIFICATION,"",[1000,int(this.selectList4.selectItem.id),2]));
               }
               break;
            case this.fixBtn:
               if(this.partyList.selectItem != null)
               {
                  dispatchEvent(new BaseEvent(UI_PARTYFLAGINSTALLPANEL_FIX_FLAG,"",int(this.partyList.selectItem.coordinateID)));
               }
               break;
            case this.renovateBtn:
               if(this.partyList.selectItem != null)
               {
                  dispatchEvent(new BaseEvent(UI_PARTYFLAGINSTALLPANEL_RENOVATE,"",int(this.partyList.selectItem.coordinateID)));
               }
         }
      }
      
      private function onList(param1:MouseEvent = null) : void
      {
         if(this.partyList.selectItem.flagID == "")
         {
            this.fixBtn.enabled = true;
            this.renovateBtn.enabled = false;
            if(Boolean(this.otherFlag) && Boolean(this.otherFlag.parent))
            {
               this.otherFlag.parent.removeChild(this.otherFlag);
               this.otherFlag.stop();
            }
         }
         else
         {
            this.fixBtn.enabled = false;
            this.renovateBtn.enabled = true;
            if(Boolean(this.otherFlag) && Boolean(this.otherFlag.parent))
            {
               this.otherFlag.parent.removeChild(this.otherFlag);
               this.otherFlag.stop();
            }
            RslLoaderManager.lazyLoad(this.onCom1,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
         }
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
                  if(_loc3_.party == "")
                  {
                     this.tipCanvas.visible = false;
                  }
                  else
                  {
                     this.tip.text = _loc3_.party;
                     this.tipCanvas.width = this.tip.width + 4;
                     this.tipCanvas.height = this.tip.height + 4;
                     this.tipCanvas.visible = true;
                     _loc4_ = _loc2_.parent.localToGlobal(new Point(_loc2_.x,_loc2_.y));
                     this.tipCanvas.x = _loc4_.x - this.tipCanvas.width;
                     this.tipCanvas.y = _loc4_.y;
                  }
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
      
      private function onCom1() : void
      {
         if(Boolean(this.otherFlag) && Boolean(this.otherFlag.parent))
         {
            this.otherFlag.parent.removeChild(this.otherFlag);
            this.otherFlag.stop();
         }
         this.otherFlag = StaticValue.getMCByClassName(StaticValue.conversionFlagID(int(this.partyList.selectItem.flagID))) as MovieClip;
         addChild(this.otherFlag);
         this.otherFlag.x = 520;
         this.otherFlag.y = 27;
      }
      
      public function setDataProvider(param1:XML, param2:int, param3:int) : void
      {
         this.partyList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.partyList.setSelectItemByIndex(0);
            this.onList();
         }
         else
         {
            this.fixBtn.enabled = false;
         }
         this.listScroll.update();
      }
      
      public function setPage(param1:int, param2:int) : void
      {
         this.pageTxt.text = param2 + "/" + param1;
      }
      
      public function fixPoint(param1:String) : void
      {
         this.point.text = param1;
      }
      
      public function setFlagID(param1:int) : void
      {
         this.flagID = param1;
         if(Boolean(this.flag) && Boolean(this.flag.parent))
         {
            this.flag.parent.removeChild(this.flag);
            this.flag.stop();
         }
         RslLoaderManager.lazyLoad(this.onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
      }
      
      private function onCom() : void
      {
         if(Boolean(this.flag) && Boolean(this.flag.parent))
         {
            this.flag.parent.removeChild(this.flag);
            this.flag.stop();
         }
         this.flag = StaticValue.getMCByClassName(StaticValue.conversionFlagID(this.flagID)) as MovieClip;
         addChild(this.flag);
         this.flag.x = 520;
         this.flag.y = 175;
      }
   }
}

