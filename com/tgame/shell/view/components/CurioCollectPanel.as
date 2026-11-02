package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.tree.FTree;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.res.shouji.ShoujiRes;
   import com.tgame.common.res.task.vo.TaskTargetData;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.character.info.data.CharShoujiData;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.shell.view.components.curio.CurioListItemRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   
   public class CurioCollectPanel extends FPanel
   {
      
      public static const UI_CURIOCOLLECTPANEL_ITEM_SUMBIT:String = "UI_CURIOCOLLECTPANEL_ITEM_SUMBIT";
      
      public static const UI_CURIOCOLLECTPANEL_ITEM_DRAWBIT:String = "UI_CURIOCOLLECTPANEL_ITEM_DRAWBIT";
      
      private var taskTree:FTree;
      
      private var taskScroll:FVScorllBar;
      
      private var listContainer:Sprite;
      
      private var curioName:FTextArea;
      
      private var curioItemName:FTextArea;
      
      private var curioCount:FTextArea;
      
      private var curioSite:FTextArea;
      
      private var curioItemContainer:Sprite;
      
      private var okBtn:SmallButton;
      
      private var drawBtn:SmallButton;
      
      private var selectID:String = "0";
      
      private var ss:StyleSheet;
      
      private var CjBar:ColorBar;
      
      public function CurioCollectPanel()
      {
         var v:Vector.<Bitmap>;
         var fb1:FTextArea;
         var ft:TextFormat;
         var img:Bitmap = null;
         var fb:FLabel = null;
         super();
         this.ss = new StyleSheet();
         this.ss.parseCSS("a{text-decoration:underline;}a:link {color: #00ff00} a:visited {color: #d59712} a:hover {color: #ff0000} a:active {color: #d59712}");
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 532;
         height = 342;
         titleText = LanResManager.getLanCommonTextWords("古玩套件收集");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.curio.collect.ui";
         addChild(img);
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         DynamicManageImages = v;
         img = StaticValue.getBitmapByClassName("ui.curio.collect.text.1");
         addChild(img);
         img.x = 60;
         img.y = 7;
         fb = new FLabel();
         with(fb)
         {
            x = 205;
            y = 73;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"需要套件");
         }
         addChild(fb);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 13;
            y = 28;
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,145,169);
            graphics.endFill();
         }
         this.taskTree = new FTree();
         this.taskTree.treeWidth = 145;
         this.taskTree.treeHeight = 169;
         this.taskTree.itemRenderer = new CurioListItemRender();
         this.listContainer.addChild(this.taskTree);
         this.taskScroll = new FVScorllBar(this.listContainer,169);
         addChild(this.taskScroll);
         this.taskScroll.x = 158;
         this.taskScroll.y = 28;
         this.listContainer.addEventListener(MouseEvent.CLICK,this.onClick);
         img = StaticValue.getBitmapByClassName("ui.curio.collect.text.2");
         addChild(img);
         img.x = 60;
         img.y = 201;
         fb1 = new FTextArea();
         with(fb1)
         {
            x = 19;
            y = 227;
            width = 150;
            height = 65;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            wordWrap = true;
            htmlText = LanResManager.getLanTextWords(this,"您可以将背包中的古玩分阶段提交");
         }
         addChild(fb1);
         fb1 = new FTextArea();
         with(fb1)
         {
            x = 330;
            y = 10;
            width = 100;
            height = 25;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            wordWrap = true;
            htmlText = LanResManager.getLanTextWords(this,"收集进度：");
         }
         addChild(fb1);
         img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(img);
         img.x = 390;
         img.y = 8;
         this.CjBar = new ColorBar(5,95,11);
         addChild(this.CjBar);
         this.CjBar.x = 405;
         this.CjBar.y = 11;
         this.CjBar.setValue(50,100);
         this.curioName = new FTextArea();
         with(this.curioName)
         {
            x = 185;
            y = 10;
            width = 328;
            height = 50;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"唐三彩套件");
         }
         addChild(this.curioName);
         ft = new TextFormat();
         ft.align = "center";
         this.curioItemName = new FTextArea();
         with(this.curioItemName)
         {
            x = 181;
            y = 100;
            width = 130;
            height = 138;
            defaultTextFormat = ft;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         addChild(this.curioItemName);
         this.curioCount = new FTextArea();
         with(this.curioCount)
         {
            x = 276;
            y = 100;
            width = 112;
            height = 138;
            defaultTextFormat = ft;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         addChild(this.curioCount);
         this.curioSite = new FTextArea();
         with(this.curioSite)
         {
            x = 389;
            y = 100;
            width = 132;
            height = 138;
            defaultTextFormat = ft;
            textColor = StaticValue.GREEN;
            styleSheet = ss;
            filters = StaticValue.filter;
         }
         addChild(this.curioSite);
         this.curioSite.addEventListener(TextEvent.LINK,this.onFindPath);
         this.curioItemContainer = new Sprite();
         addChild(this.curioItemContainer);
         this.curioItemContainer.x = 191;
         this.curioItemContainer.y = 254;
         fb1 = new FTextArea();
         with(fb1)
         {
            x = 185;
            y = 235;
            width = 100;
            height = 25;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            wordWrap = true;
            htmlText = LanResManager.getLanTextWords(this,"背包中的数量");
         }
         addChild(fb1);
         this.okBtn = new SmallButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"提交物品");
         addChild(this.okBtn);
         this.okBtn.x = 430;
         this.okBtn.y = 253;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onOK);
         this.okBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"自动将背包中的古玩进行提交") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"已提交数") + "</font></textformat>";
         this.drawBtn = new SmallButton();
         this.drawBtn.label = LanResManager.getLanTextWords(this,"领取奖励");
         addChild(this.drawBtn);
         this.drawBtn.x = 430;
         this.drawBtn.y = 273;
         this.drawBtn.addEventListener(MouseEvent.CLICK,this.onOK);
         this.drawBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"当收集进度为100%时") + "</font></textformat>";
      }
      
      private function onOK(param1:MouseEvent) : void
      {
         if(this.taskTree.selectItem == null || this.taskTree.selectItem.label == null)
         {
            return;
         }
         switch(param1.target)
         {
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_CURIOCOLLECTPANEL_ITEM_SUMBIT,"",int(this.taskTree.selectItem.label)));
               break;
            case this.drawBtn:
               dispatchEvent(new BaseEvent(UI_CURIOCOLLECTPANEL_ITEM_DRAWBIT,"",int(this.taskTree.selectItem.label)));
         }
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         this.clear();
         if(this.taskTree.selectItem == null || this.taskTree.selectItem.state == null)
         {
            this.selectID = "-1";
            this.okBtn.enabled = false;
            this.drawBtn.enabled = false;
         }
         else
         {
            this.selectID = this.taskTree.selectItem.label;
            this.setContent(int(this.selectID));
         }
         this.taskScroll.update();
      }
      
      private function onFindPath(param1:TextEvent) : void
      {
         MainCharSeachPathManager.mainCharWalk(param1);
      }
      
      private function setContent(param1:int) : void
      {
         var _loc8_:ItemFace = null;
         var _loc9_:TaskTargetData = null;
         var _loc10_:TaskTargetData = null;
         var _loc14_:Boolean = false;
         var _loc15_:Goods = null;
         var _loc2_:CharShoujiData = GameInstance.mainCharData.shoujiInfo.getShouji(param1);
         var _loc3_:ShoujiRes = _loc2_.shoujiRes;
         this.curioName.text = _loc3_.name + LanResManager.getLanTextWords(this,"奖励") + _loc3_.rewardDesc;
         var _loc4_:int = int(_loc2_.targetGoods.length);
         var _loc5_:String = "<textformat leading=\'12\'>";
         var _loc6_:String = "<textformat leading=\'12\'>";
         var _loc7_:String = "<textformat leading=\'12\'>";
         var _loc11_:* = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         for each(_loc9_ in _loc2_.shoujiRes.targetGoods)
         {
            _loc10_ = _loc2_.getTargetGoods(_loc9_.id);
            _loc14_ = false;
            _loc15_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc9_.id,true);
            if(_loc2_.isComplete == 2 || _loc2_.isComplete == 3)
            {
               _loc14_ = false;
            }
            else if(_loc10_.count >= _loc9_.count)
            {
               _loc14_ = false;
            }
            else
            {
               _loc14_ = true;
            }
            _loc8_ = new ItemFace(_loc15_);
            this.curioItemContainer.addChild(_loc8_);
            _loc8_.x = _loc11_++ * 42;
            _loc5_ += _loc9_.name + "<br />";
            if(_loc14_)
            {
               _loc6_ += "<font color=\'#FF0000\'>" + _loc10_.count + "</font><font color=\'#FFFFFF\'>/" + _loc9_.count + "</font><br />";
               _loc7_ += "<u><a href=\"event:" + _loc9_.pos.toSplitString() + "\">" + _loc9_.userData + "</a></u><br />";
               _loc12_ += _loc10_.count;
               _loc13_ += _loc9_.count;
            }
            else
            {
               _loc6_ += _loc9_.count + "/" + _loc9_.count + "<br />";
               _loc7_ += _loc9_.userData + "<br />";
               _loc12_ += _loc9_.count;
               _loc13_ += _loc9_.count;
            }
         }
         _loc5_ += "</textformat>";
         _loc6_ += "</textformat>";
         _loc7_ += "</textformat>";
         this.curioItemName.htmlText = _loc5_;
         this.curioCount.htmlText = _loc6_;
         this.curioSite.htmlText = _loc7_;
         if(_loc2_.isComplete == 1)
         {
            this.okBtn.enabled = true;
            this.CjBar.setValue(_loc12_,_loc13_);
            this.drawBtn.enabled = false;
         }
         else if(_loc2_.isComplete == 3)
         {
            this.okBtn.enabled = false;
            this.CjBar.setValue(_loc13_,_loc13_);
            this.drawBtn.enabled = true;
         }
         else if(_loc2_.isComplete == 2)
         {
            this.okBtn.enabled = false;
            this.CjBar.setValue(_loc13_,_loc13_);
            this.drawBtn.enabled = false;
         }
      }
      
      private function clear() : void
      {
         this.curioName.text = "";
         this.curioItemName.htmlText = "";
         this.curioCount.htmlText = "";
         this.curioSite.htmlText = "";
         this.CjBar.setValue(0,0);
         while(this.curioItemContainer.numChildren > 0)
         {
            this.curioItemContainer.removeChildAt(0);
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function set dataProvider(param1:XML) : void
      {
         var _loc2_:XML = null;
         this.taskTree.dataProvider = param1;
         if(!this.taskTree.showNodeByLabel(this.selectID) && param1.children().length() > 0)
         {
            _loc2_ = param1.children()[0];
            this.taskTree.showNodeByLabel(_loc2_.children()[0].@label);
         }
         this.taskScroll.update();
         this.onClick();
      }
      
      public function showSelectItemByID(param1:String) : void
      {
         this.onClick();
      }
   }
}

