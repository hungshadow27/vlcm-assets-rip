package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
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
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.shell.view.components.instanceportal.FubenTongguanCanvas;
   import com.tgame.shell.view.components.instanceportal.IngressFubenTishiCanvas;
   import com.tgame.shell.view.components.instanceportal.InstanceConvectionListRender;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.*;
   
   public class InstanceConvectionPanel extends FPanel
   {
      
      public static const UI_INSTANCECONVECTION_CHECK_CLICK:String = "UI_INSTANCECONVECTION_CHECK_CLICK";
      
      public static const UI_INSTANCECONVECTION_BTNCLICK:String = "UI_INSTANCECONVECTION_BTNCLICK";
      
      public static const UI_INSTANCECONVECTION_FUBENLINGBTNCLICK:String = "UI_INSTANCECONVECTION_FUBENLINGBTNCLICK";
      
      public static const UI_FUBENLINPANEL_SUBBTN:String = "UI_FUBENLINPANEL_SUBBTN";
      
      public static const UI_FUBENLINPANEL_QUXIAOBTN:String = "UI_FUBENLINPANEL_QUXIAOBTN";
      
      public static const UI_CHANGJINGGEMILING_SUBBTN:String = "UI_CHANGJINGGEMILING_SUBBTN";
      
      public static const SHOW_CHAKANFUBENJINGSUBANG_CLICK:String = "SHOW_CHAKANFUBENJINGSUBANG_CLICK";
      
      public static const ITEM_LINK_CLICK:String = "ITEM_LINK_CLICK";
      
      public static const UI_FUBENTONGGUANCANVAS_SUBCLICK:String = "UI_FUBENTONGGUANCANVAS_SUBCLICK";
      
      private var tip3:FTextArea;
      
      private var tip1:FTextArea;
      
      private var tip2:FTextArea;
      
      private var jlxxFta:FTextArea;
      
      private var fbsmFta:FTextArea;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var check1:FCheckBox;
      
      private var SubBtn:SecondButton;
      
      private var FubenlingBtn:SecondButton;
      
      private var ShowJsbBtn:SecondButton;
      
      private var ewjlFta:FTextArea;
      
      private var shujuArr:Array;
      
      private var IngressFuben:IngressFubenTishiCanvas;
      
      private var FubenTongguan:FubenTongguanCanvas;
      
      private var listContainerX1:Sprite;
      
      private var ScrollX1:FVScorllBar;
      
      private var giftListX1:FList;
      
      private var selectBtn:FSimpleButton;
      
      private var listContainer2:FCanvas;
      
      private var giftList2:FList;
      
      private var Scroll2:FVScorllBar;
      
      private var selectGrade:FLabel;
      
      private var selectList2:FList;
      
      private var bg9:F9GridBitmap;
      
      private var text:FLabel;
      
      private var text1:FLabel;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var spr1:Sprite;
      
      private var fc1:FCanvas;
      
      private var line:Bitmap;
      
      private var selectNYD:FLabel;
      
      private var selectListNYD:FList;
      
      private var selectBtnNYD:FSimpleButton;
      
      private var listContainerNYD:FCanvas;
      
      public function InstanceConvectionPanel()
      {
         this.shujuArr = new Array();
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 535;
         height = 306;
         this.titleText = LanResManager.getLanCommonTextWords("副本传送");
         this.fc1 = new FCanvas();
         this.fc1.x = 10;
         this.fc1.y = 2;
         this.fc1.width = 290;
         this.fc1.height = 316 - 86 + 30;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 174 + 125;
         this.fc1.y = 2;
         this.fc1.width = 400 - 43 - 130;
         this.fc1.height = 316 - 86 + 30;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.line = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         addChild(this.line);
         this.line.width = 285;
         this.line.height = 25;
         this.line.x = 12;
         this.line.y = 4;
         this.line = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         addChild(this.line);
         this.line.width = 285;
         this.line.height = 24;
         this.line.x = 12;
         this.line.y = 28 + 207;
         this.line = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.line);
         this.line.width = 20;
         this.line.height = 2;
         this.line.x = 126;
         this.line.y = 8;
         this.line.rotation = 90;
         this.line = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.line);
         this.line.width = 20;
         this.line.height = 2;
         this.line.x = 184;
         this.line.y = 8;
         this.line.rotation = 90;
         this.line = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.line);
         this.line.width = 20;
         this.line.height = 2;
         this.line.x = 235;
         this.line.y = 8;
         this.line.rotation = 90;
         this.line = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.line);
         this.line.width = 286;
         this.line.height = 2;
         this.line.x = 12;
         this.line.y = 28;
         this.line = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.line);
         this.line.width = 286;
         this.line.height = 2;
         this.line.x = 12;
         this.line.y = 28 + 207;
         this.line = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.line);
         this.line.width = 400 - 50 - 130;
         this.line.height = 2;
         this.line.x = 303;
         this.line.y = 28 + 24;
         this.tip3 = new FTextArea();
         with(this.tip3)
         {
            width = 250;
            height = 20;
            x = 55;
            y = 8;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("副本名称       等级    组队     次数") + "</font>";
         }
         addChild(this.tip3);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 13;
            y = 30;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,265,205);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new InstanceConvectionListRender();
         this.giftList.listWidth = 265;
         this.listContainer.addChild(this.giftList);
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,205);
         addChild(this.Scroll);
         this.Scroll.x = 280;
         this.Scroll.y = 30;
         this.spr1 = new Sprite();
         addChild(this.spr1);
         this.spr1.y = 238;
         this.check1 = new FCheckBox();
         this.spr1.addChild(this.check1);
         this.check1.x = 18;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip3 = new FTextArea();
         with(this.tip3)
         {
            width = 250;
            height = 20;
            x = 40;
            y = 1;
            textColor = StaticValue.YELLOW;
            text = LanResManager.getLanCommonTextWords("只显示我可以参与的副本");
         }
         this.spr1.addChild(this.tip3);
         this.ShowJsbBtn = new SecondButton();
         this.ShowJsbBtn.label = LanResManager.getLanCommonTextWords("查看副本竞速榜");
         this.spr1.addChild(this.ShowJsbBtn);
         this.ShowJsbBtn.x = 190;
         this.ShowJsbBtn.y = -2;
         this.ShowJsbBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip3 = new FTextArea();
         with(this.tip3)
         {
            width = 120;
            height = 20;
            x = 307;
            y = 8;
            textColor = StaticValue.ORANGE;
            text = LanResManager.getLanCommonTextWords("副本内奖励丰厚度") + "：";
         }
         addChild(this.tip3);
         this.tip3 = new FTextArea();
         with(this.tip3)
         {
            width = 120;
            height = 20;
            x = 307;
            y = 30;
            textColor = StaticValue.ORANGE;
            text = LanResManager.getLanCommonTextWords("副本进入模式：");
         }
         addChild(this.tip3);
         this.jlxxFta = new FTextArea();
         with(this.jlxxFta)
         {
            width = 100;
            height = 20;
            x = 155 + 335 - 60;
            y = 10;
            textColor = StaticValue.ORANGE;
            htmlText = "";
         }
         addChild(this.jlxxFta);
         this.listContainerX1 = new Sprite();
         addChild(this.listContainerX1);
         with(this.listContainerX1)
         {
            x = 307;
            y = 60;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,196,172);
            graphics.endFill();
         }
         this.ScrollX1 = new FVScorllBar(this.listContainerX1,172);
         addChild(this.ScrollX1);
         this.ScrollX1.x = 505;
         this.ScrollX1.y = 60;
         this.SubBtn = new SecondButton();
         this.SubBtn.label = LanResManager.getLanCommonTextWords("进入");
         this.spr1.addChild(this.SubBtn);
         this.SubBtn.x = 330 - 20;
         this.SubBtn.y = -2;
         this.SubBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.FubenlingBtn = new SecondButton();
         this.FubenlingBtn.label = LanResManager.getLanCommonTextWords("副本令进入");
         addChild(this.FubenlingBtn);
         this.FubenlingBtn.x = 410;
         this.FubenlingBtn.y = 205;
         this.FubenlingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.FubenlingBtn.visible = false;
         this.text1 = new FLabel();
         with(this.text1)
         {
            x = 32 + 310 + 11;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("进入模式:");
         }
         this.spr1.addChild(this.text1);
         this.text1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.text1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 90;
         this.bg9.height = 19;
         this.bg9.x = 32 + 335 + 60;
         this.bg9.y = -1;
         this.spr1.addChild(this.bg9);
         this.selectGrade = new FLabel();
         with(this.selectGrade)
         {
            x = 155 + 335 - 60;
            y = -2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("普通奖励");
         }
         this.spr1.addChild(this.selectGrade);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         this.spr1.addChild(this.selectBtn);
         this.selectBtn.x = 272 + 335 - 60 - 44 - 6;
         this.selectBtn.y = 1;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer2 = new FCanvas();
         this.listContainer2.skin = "backGroud";
         this.listContainer2.x = 150 + 335 - 60;
         this.listContainer2.y = 20;
         this.spr1.addChild(this.listContainer2);
         this.listContainer2.visible = false;
         this.selectList2 = new FList();
         this.selectList2.skin = "list";
         this.selectList2.listWidth = 70;
         this.selectList2.x = 5;
         this.selectList2.y = 2;
         this.selectList2.itemRenderer = new StrengthenListRender();
         this.selectList2.dataProvider = <list>
																	<node label={LanResManager.getLanCommonTextWords("普通奖励")} id="1"/>
																	<node label={LanResManager.getLanCommonTextWords("副本令")} id="3"/>
																	<node label={LanResManager.getLanCommonTextWords("藏经阁密令")} id="4"/>
										</list>;
         this.listContainer2.addChild(this.selectList2);
         this.selectList2.setSelectItemByIndex(0);
         this.selectList2.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.listContainer2.width = this.selectList2.width + 10;
         this.listContainer2.height = this.selectList2.height + 4;
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
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 90;
         this.bg9.height = 19;
         this.bg9.x = 32 + 335 + 60;
         this.bg9.y = 10 + 20;
         addChild(this.bg9);
         this.selectNYD = new FLabel();
         with(this.selectNYD)
         {
            x = 155 + 335 - 60;
            y = 10 + 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("中等模式");
         }
         addChild(this.selectNYD);
         this.selectBtnNYD = new FSimpleButton();
         this.selectBtnNYD.skin = "bottomButton";
         addChild(this.selectBtnNYD);
         this.selectBtnNYD.x = 272 + 335 - 60 - 44 - 6;
         this.selectBtnNYD.y = 10 + 20;
         this.selectBtnNYD.addEventListener(MouseEvent.CLICK,this.showSelectListNYD);
         this.listContainerNYD = new FCanvas();
         this.listContainerNYD.skin = "backGroud";
         this.listContainerNYD.x = 150 + 335 - 60;
         this.listContainerNYD.y = 30 + 20;
         addChild(this.listContainerNYD);
         this.listContainerNYD.visible = false;
         this.selectListNYD = new FList();
         this.selectListNYD.skin = "list";
         this.selectListNYD.listWidth = 70;
         this.selectListNYD.x = 5;
         this.selectListNYD.y = 2;
         this.selectListNYD.itemRenderer = new StrengthenListRender();
         this.selectListNYD.dataProvider = <list>
																	<node label={LanResManager.getLanCommonTextWords("中等模式")} id="1"/>
																	<node label={LanResManager.getLanCommonTextWords("困难模式")} id="2"/>
																	<node label={LanResManager.getLanCommonTextWords("超级模式")} id="3"/>
										</list>;
         this.listContainerNYD.addChild(this.selectListNYD);
         this.selectListNYD.setSelectItemByIndex(0);
         this.selectListNYD.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.listContainerNYD.width = this.selectListNYD.width + 10;
         this.listContainerNYD.height = this.selectListNYD.height + 4;
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         this.listContainer2.visible = !this.listContainer2.visible;
      }
      
      private function showSelectListNYD(param1:MouseEvent) : void
      {
         this.listContainerNYD.visible = !this.listContainerNYD.visible;
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc5_:int = 0;
         this.selectNYD.text = this.selectListNYD.selectItem.label;
         this.listContainerNYD.visible = false;
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < this.giftList.selectItem.jiangliArr.length)
         {
            _loc5_ = int(this.giftList.selectItem.jiangliArr[_loc4_].jiangliCount);
            if(this.selectListNYD.selectItem.id == 1)
            {
               _loc5_ *= 1;
            }
            else if(this.selectListNYD.selectItem.id == 2)
            {
               _loc5_ *= 2;
            }
            else if(this.selectListNYD.selectItem.id == 3)
            {
               _loc5_ *= 3;
            }
            _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "<a href=\'event:" + this.giftList.selectItem.jiangliArr[_loc4_].jiangliID + "\'>" + (GoodsResManager.getGoodsRes(this.giftList.selectItem.jiangliArr[_loc4_].jiangliID) as GoodsRes).name + "</a>×" + _loc5_ + "</font><br>";
            this.ewjlFta.htmlText = _loc3_;
            _loc4_++;
         }
      }
      
      private function onLink(param1:TextEvent) : void
      {
         dispatchEvent(new BaseEvent(ITEM_LINK_CLICK,"",[param1.text,Tools.currentStage.mouseX,Tools.currentStage.mouseY]));
      }
      
      private function onMouseTip3(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.text1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.text1.getCharIndexAtPoint(this.text1.mouseX,this.text1.mouseY);
               if(_loc2_ >= this.text1.text.indexOf(LanResManager.getLanCommonTextWords("进入模式:")) && _loc2_ <= this.text1.text.indexOf(LanResManager.getLanCommonTextWords("进入模式:")) + 4)
               {
                  _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("进入模式说明：") + "<br></font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"普通奖励模式：进入时消耗一次副本进入次数，最后通关时获得正常通关奖励。双倍奖励模式：进入时消耗两次副本进入次数，最后通关时获得二倍通关奖励。如果在双倍奖励模式下通关失败，不会返还额外消耗的进入次数。副本令：使用副本令进入副本，仅限连斩副本") + "</font></textformat>";
                  this.showTip(_loc3_);
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.text1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 10;
         this.tipCanvas.y = mouseY;
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
         switch(param1.currentTarget)
         {
            case this.check1:
               this.SetData(this.check1.selectState);
         }
         switch(param1.target)
         {
            case this.SubBtn:
               if(this.giftList.selectItem == null)
               {
                  return;
               }
               if(this.selectList2.selectItem.id == "1")
               {
                  dispatchEvent(new BaseEvent(UI_INSTANCECONVECTION_BTNCLICK,"",[this.giftList.selectItem.id,this.selectList2.selectItem.id,this.selectListNYD.selectItem.id]));
               }
               else if(this.selectList2.selectItem.id == "2")
               {
                  dispatchEvent(new BaseEvent(UI_INSTANCECONVECTION_BTNCLICK,"",[this.giftList.selectItem.id,this.selectList2.selectItem.id,this.selectListNYD.selectItem.id]));
               }
               else if(this.selectList2.selectItem.id == "3")
               {
                  dispatchEvent(new BaseEvent(UI_INSTANCECONVECTION_FUBENLINGBTNCLICK,"",[this.giftList.selectItem.id,this.selectListNYD.selectItem.id]));
               }
               else if(this.selectList2.selectItem.id == "4")
               {
                  dispatchEvent(new BaseEvent(UI_CHANGJINGGEMILING_SUBBTN,"",[this.giftList.selectItem.id,this.selectListNYD.selectItem.id]));
               }
               break;
            case this.FubenlingBtn:
               if(this.giftList.selectItem == null)
               {
                  return;
               }
               dispatchEvent(new BaseEvent(UI_INSTANCECONVECTION_FUBENLINGBTNCLICK,"",[this.giftList.selectItem.id,this.selectListNYD.selectItem.id]));
               break;
            case this.ShowJsbBtn:
               dispatchEvent(new BaseEvent(SHOW_CHAKANFUBENJINGSUBANG_CLICK));
         }
      }
      
      private function SetData(param1:Boolean) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         this.jlxxFta.htmlText = "";
         if(this.fbsmFta != null)
         {
            this.fbsmFta.htmlText = "";
         }
         if(param1)
         {
            _loc2_ = new Array();
            _loc3_ = 0;
            while(_loc3_ < this.shujuArr.length)
            {
               if(this.shujuArr[_loc3_].enter)
               {
                  _loc2_.push(this.shujuArr[_loc3_]);
               }
               _loc3_++;
            }
            this.giftList.dataProvider = _loc2_;
            this.Scroll.update();
         }
         else
         {
            this.giftList.dataProvider = this.shujuArr;
            this.Scroll.update();
         }
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         var sayQ:int;
         var strx1:String;
         var i:int;
         var astr:String;
         var i1:int;
         var jiangliNum:int = 0;
         var e:MouseEvent = param1;
         if(this.giftList.selectItem == null)
         {
            return;
         }
         sayQ = this.giftList.selectItem.hortatory / 2;
         strx1 = "";
         i = 0;
         while(i < sayQ)
         {
            strx1 += "★";
            i++;
         }
         if(this.giftList.selectItem.hortatory % 2 != 0)
         {
            if(this.giftList.selectItem.hortatory % 2 == 1)
            {
               strx1 += "☆";
            }
         }
         this.jlxxFta.htmlText = strx1;
         if(this.tip1 != null)
         {
            this.listContainerX1.removeChild(this.tip1);
         }
         if(this.ewjlFta != null)
         {
            this.listContainerX1.removeChild(this.ewjlFta);
         }
         if(this.tip2 != null)
         {
            this.listContainerX1.removeChild(this.tip2);
         }
         if(this.fbsmFta != null)
         {
            this.listContainerX1.removeChild(this.fbsmFta);
         }
         this.tip1 = new FTextArea();
         with(this.tip1)
         {
            width = 196;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("通关奖励") + "：";
         }
         this.listContainerX1.addChild(this.tip1);
         astr = "";
         i1 = 0;
         while(i1 < this.giftList.selectItem.jiangliArr.length)
         {
            jiangliNum = int(this.giftList.selectItem.jiangliArr[i1].jiangliCount);
            if(this.selectListNYD.selectItem.id == 1)
            {
               jiangliNum *= 1;
            }
            else if(this.selectListNYD.selectItem.id == 2)
            {
               jiangliNum *= 2;
            }
            else if(this.selectListNYD.selectItem.id == 3)
            {
               jiangliNum *= 3;
            }
            astr += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "<a href=\'event:" + this.giftList.selectItem.jiangliArr[i1].jiangliID + "\'>" + (GoodsResManager.getGoodsRes(this.giftList.selectItem.jiangliArr[i1].jiangliID) as GoodsRes).name + "</a>×" + jiangliNum + "</font><br>";
            i1++;
         }
         this.ewjlFta = new FTextArea();
         with(this.ewjlFta)
         {
            width = 196;
            x = 26;
            y = tip1.y + tip1.height;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            htmlText = astr;
         }
         this.ewjlFta.addEventListener(TextEvent.LINK,this.onLink);
         this.listContainerX1.addChild(this.ewjlFta);
         this.tip2 = new FTextArea();
         with(this.tip2)
         {
            width = 196;
            y = ewjlFta.y + ewjlFta.height;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("副本说明") + "：";
         }
         this.listContainerX1.addChild(this.tip2);
         this.fbsmFta = new FTextArea();
         with(this.fbsmFta)
         {
            width = 196;
            y = tip2.y + tip2.height;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'8\'>" + giftList.selectItem.say + "</textformat>";
         }
         this.listContainerX1.addChild(this.fbsmFta);
         this.ScrollX1.update();
      }
      
      public function SetInitializePlay(param1:Array) : void
      {
         this.jlxxFta.htmlText = "";
         this.check1.selectState = false;
         this.shujuArr = param1;
         this.giftList.dataProvider = param1;
         this.Scroll.update();
         this.selectGrade.text = LanResManager.getLanCommonTextWords("普通奖励");
         this.selectList2.setSelectItemByLabel(LanResManager.getLanCommonTextWords("普通奖励"));
      }
      
      public function showFuBenLingPanel(param1:int, param2:String, param3:int, param4:int) : void
      {
         var _loc5_:FubenlingPanel = new FubenlingPanel();
         _loc5_.$parent = this;
         _loc5_.SetInitialize(param1,param2,param3,param4);
         POPWindowManager.showWindow(_loc5_);
      }
      
      public function showIngressFubenPanel() : void
      {
         if(!this.IngressFuben)
         {
            this.IngressFuben = new IngressFubenTishiCanvas();
         }
         this.IngressFuben.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.IngressFuben);
         this.IngressFuben.x = (GameConfig.sceneWidth - this.IngressFuben.width) / 2;
         this.IngressFuben.y = (GameConfig.sceneHeight - this.IngressFuben.height) / 2;
      }
      
      public function showFubenTongguanPanel(param1:String, param2:Array, param3:Boolean, param4:int) : void
      {
         if(!this.FubenTongguan)
         {
            this.FubenTongguan = new FubenTongguanCanvas();
            UIEventsRegisterManager.registerUI(this.FubenTongguan,FubenTongguanCanvas);
         }
         this.FubenTongguan.visible = true;
         this.FubenTongguan.$parent = this;
         this.FubenTongguan.setInitialize(param1,param2,param3,param4);
         GameInstance.uiInstance.uiContainer.addChild(this.FubenTongguan);
         this.FubenTongguan.x = (GameConfig.sceneWidth - this.FubenTongguan.width) / 2;
         this.FubenTongguan.y = (GameConfig.sceneHeight - this.FubenTongguan.height) / 2;
      }
      
      public function closeFubenTongguan() : void
      {
         this.FubenTongguan.onClose();
      }
   }
}

