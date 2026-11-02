package com.tgame.shell.view.components.rankinglist
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.MountSkill;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.RankingListPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.*;
   
   public class RideRankingListCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var skillContainer:Sprite;
      
      private var equipContainer:Sprite;
      
      private var title2:FTextArea;
      
      private var title3:FTextArea;
      
      private var rankingList:FList;
      
      private var NOLabel:FLabel;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var pageCount:FLabel;
      
      private var chenghao:FTextArea;
      
      private var rideName:FLabel;
      
      private var savvy:FLabel;
      
      private var attackBar:ColorBar;
      
      private var recoveryBar:ColorBar;
      
      private var lightBar:ColorBar;
      
      private var healthBar:ColorBar;
      
      private var tips:FTextArea;
      
      private var dreamBar:DreamBar;
      
      private var valueContainer:Sprite;
      
      private var chengHaoImg:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var headContainer:Sprite;
      
      private var headImg:Bitmap;
      
      private var headTipCanvas:FCanvas;
      
      private var solt:Bitmap;
      
      private var anju:int = 0;
      
      private var jiangsheng:int = 0;
      
      private var jiaodeng:int = 0;
      
      private var tieti:int = 0;
      
      public function RideRankingListCanvas()
      {
         var lb:FLabel;
         var img:Bitmap;
         super();
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
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.ranklist.ride.ui";
         this._mask = new Shape();
         with(this._mask)
         {
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,125,84);
            graphics.endFill();
         }
         this._mask.x = 264;
         this._mask.y = 21;
         addChild(this._mask);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.chengHaoImg = new Bitmap(new BitmapData(120,20.8,true,0));
         this.chengHaoImg.width = 120;
         this.chengHaoImg.height = 20.8;
         addChild(this.chengHaoImg);
         this.chengHaoImg.x = 266;
         this.chengHaoImg.y = 4;
         switch(OtherConst.mount_add_count)
         {
            case 0:
               break;
            case 1:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 92 + 175 + 40;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               break;
            case 2:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 45 + 175 + 40 + 6 + 10;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 138 + 175 + 40 - 6 - 10;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               break;
            case 3:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 45 + 175 + 40 + 6;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 92 + 175 + 40;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 138 + 175 + 40 - 6;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               break;
            case 4:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 45 + 175 + 40 + 6;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 92 + 175 + 40;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 138 + 175 + 40 - 6;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 45 + 175 + 40 + 6;
               this.solt.y = 25;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 138 + 175 + 40 - 6;
               this.solt.y = 25;
               addChild(this.solt);
               break;
            case 5:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 45 + 175 + 40 + 6;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 92 + 175 + 40;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 138 + 175 + 40 - 6;
               this.solt.y = 61 + 3;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 45 + 175 + 40 + 6;
               this.solt.y = 25;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 138 + 175 + 40 - 6;
               this.solt.y = 25;
               addChild(this.solt);
         }
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 228;
         this.equipContainer.y = 23;
         this.skillContainer = new Sprite();
         addChild(this.skillContainer);
         this.skillContainer.x = 236;
         this.skillContainer.y = 225;
         lb = new FLabel();
         with(lb)
         {
            x = 15;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(PlayerRankingListCanvas,"排名");
         addChild(lb);
         this.title2 = new FTextArea();
         with(this.title2)
         {
            x = 54;
            y = 6;
            width = 80;
            height = 20;
            defaultTextFormat = new TextFormat(null,null,StaticValue.WHITE,null,null,null,null,null,"center");
            filters = StaticValue.filter;
         }
         this.title2.text = LanResManager.getLanTextWords(PlayerRankingListCanvas,"姓名");
         addChild(this.title2);
         this.title3 = new FTextArea();
         with(this.title3)
         {
            x = 136;
            y = 6;
            width = 84;
            height = 20;
            defaultTextFormat = new TextFormat(null,null,StaticValue.WHITE,null,null,null,null,null,"center");
            filters = StaticValue.filter;
         }
         this.title3.text = LanResManager.getLanTextWords(PlayerRankingListCanvas,"等级");
         addChild(this.title3);
         this.rankingList = new FList();
         this.rankingList.skin = "list";
         this.rankingList.listWidth = 218;
         this.rankingList.listHeight = 220;
         this.rankingList.itemRenderer = new RankingListRanader();
         addChild(this.rankingList);
         this.rankingList.x = 3;
         this.rankingList.y = 29;
         this.rankingList.addEventListener(MouseEvent.CLICK,this.onList);
         this.rankingList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.rankingList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
         this.rankingList.dataProvider = <list>
<node label="id" NO="1" player="玩家名字排行" count="26606606"/> 
<node label="id" NO="2" player="玩家名字排行" count="26606606"/> 
<node label="id" NO="3" player="玩家名字排行" count="26606606"/> 
<node label="id" NO="4" player="玩家名字排行" count="26606606"/> 
<node label="id" NO="5" player="玩家名字排行" count="26606606"/> 
<node label="id" NO="6" player="玩家名字排行" count="26606606"/> 
<node label="id" NO="7" player="玩家名字排行" count="26606606"/> 
<node label="id" NO="8" player="玩家名字排行" count="26606606"/> 
<node label="id" NO="9" player="玩家名字排行" count="26606606"/> 
<node label="id" NO="10" player="玩家名字排行" count="26606606"/> 
				</list>;
         lb = new FLabel();
         with(lb)
         {
            x = 55;
            y = 253;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanCommonTextWords("您的当前排名：");
         addChild(lb);
         this.NOLabel = new FLabel();
         with(this.NOLabel)
         {
            x = 140;
            y = 253;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "100";
         }
         addChild(this.NOLabel);
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 38;
         this.homePageBtn.y = 284;
         this.homePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = this.homePageBtn.x + 42;
         this.preBtn.y = this.homePageBtn.y;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = preBtn.x + 20;
            y = homePageBtn.y;
            textColor = StaticValue.WHITE;
            text = "1/1";
         }
         addChild(this.pageCount);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = this.pageCount.x + 29;
         this.nextBtn.y = this.homePageBtn.y;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = this.nextBtn.x + 25;
         this.endPageBtn.y = this.homePageBtn.y;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.chenghao = new FTextArea();
         with(this.chenghao)
         {
            x = 225;
            y = 6;
            width = 204;
            height = 20;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,null,StaticValue.YELLOW,null,null,null,null,null,"center");
            htmlText = "";
         }
         addChild(this.chenghao);
         this.tips = new FTextArea();
         with(this.tips)
         {
            x = 225;
            y = 60;
            width = 204;
            height = 20;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,null,StaticValue.YELLOW,null,null,null,null,null,"center");
            htmlText = LanResManager.getLanTextWords(PlayerRankingListCanvas,"玩家不在线");
            visible = false;
         }
         addChild(this.tips);
         lb = new FLabel();
         with(lb)
         {
            x = 227;
            y = 121;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"名称悟性");
         addChild(lb);
         this.rideName = new FLabel();
         with(this.rideName)
         {
            x = 254;
            y = 121;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("的卢马");
         }
         this.rideName.text = LanResManager.getLanTextWords(this,"的卢马");
         addChild(this.rideName);
         this.savvy = new FLabel();
         with(this.savvy)
         {
            x = 380;
            y = 121;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "999";
         }
         addChild(this.savvy);
         img = StaticValue.getBitmapByClassName("ui.ride.value.title");
         addChild(img);
         img.x = 227;
         img.y = 145;
         this.valueContainer = new Sprite();
         addChild(this.valueContainer);
         this.valueContainer.x = 319;
         this.valueContainer.y = 147;
         lb = new FLabel();
         with(lb)
         {
            x = 227;
            y = 167;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"攻击潜力");
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 227;
            y = 180;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"防御潜力");
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 227;
            y = 193;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"轻身潜力");
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 227;
            y = 206;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"健体潜力");
         addChild(lb);
         this.attackBar = new ColorBar(5,134,5);
         addChild(this.attackBar);
         this.attackBar.x = 288;
         this.attackBar.y = 172;
         this.recoveryBar = new ColorBar(5,134,5);
         addChild(this.recoveryBar);
         this.recoveryBar.x = 288;
         this.recoveryBar.y = 185;
         this.lightBar = new ColorBar(5,134,5);
         addChild(this.lightBar);
         this.lightBar.x = 288;
         this.lightBar.y = 198;
         this.healthBar = new ColorBar(5,134,5);
         addChild(this.healthBar);
         this.healthBar.x = 288;
         this.healthBar.y = 211;
         this.dreamBar = new DreamBar();
         addChild(this.dreamBar);
         this.dreamBar.y = 104;
         this.dreamBar.x = 290;
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage,false,-int.MAX_VALUE);
         this.headContainer = new Sprite();
         this.headContainer.x = 309;
         this.headContainer.y = 27;
         addChild(this.headContainer);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OVER,this.onHeadMouseTip);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OUT,this.onHeadMouseTip);
         this.headImg = new Bitmap();
         this.headTipCanvas = new FCanvas();
         this.headTipCanvas.skin = "menuBg";
         this.headTipCanvas.addChild(this._avatar);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(0,0);
         _loc2_.graphics.drawRect(-9999,0,999999,999999);
         _loc2_.graphics.endFill();
         addChild(_loc2_);
         this.mask = _loc2_;
      }
      
      private function onList(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_PARTICULAR_INFO_SHOW,"",{
            "playerID":int(this.rankingList.selectItem.label),
            "mountID":int(this.rankingList.selectItem.mountID),
            "mEvent":param1,
            "name":String(this.rankingList.selectItem.player)
         }));
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
               this.rankingList.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target as TextField)
               {
                  _loc2_ = (param1.target as TextField).parent as FListCellRenderer;
                  _loc3_ = _loc2_.data;
                  this.tip.text = _loc3_.player;
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
               this.rankingList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               Tools.currentStage.removeChild(this.tipCanvas);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.homePageBtn:
               this.$parent.dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_GET_PAGE,"",1));
               break;
            case this.preBtn:
               this.$parent.dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_GET_PAGE,"",2));
               break;
            case this.nextBtn:
               this.$parent.dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_GET_PAGE,"",3));
               break;
            case this.endPageBtn:
               this.$parent.dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_GET_PAGE,"",4));
         }
      }
      
      private function onHeadMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.headContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onHeadMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this._avatar == null)
               {
                  return;
               }
               if(this.headTipCanvas.getChildByName("avatar") == null)
               {
                  this.headTipCanvas.addChild(this._avatar);
               }
               Tools.currentStage.addChild(this.headTipCanvas);
               this.headTipCanvas.width = 240;
               this.headTipCanvas.height = 170;
               this.headTipCanvas.x = Tools.currentStage.mouseX + 15;
               this.headTipCanvas.y = Tools.currentStage.mouseY + 25;
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.headTipCanvas.parent != null)
               {
                  this.headTipCanvas.parent.removeChild(this.headTipCanvas);
               }
               this.headContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onHeadMouseTip);
         }
      }
      
      private function setEquip(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         var _loc5_:Goods = null;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.anju = 0;
         this.jiangsheng = 0;
         this.jiaodeng = 0;
         this.tieti = 0;
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc5_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc5_);
            _loc4_.showStrengthenLv = true;
            this.equipContainer.addChild(_loc4_);
            switch(_loc5_.position)
            {
               case ItemPositionRange.POSTION_HOURSE_ANJU:
                  _loc4_.x = 1;
                  _loc4_.y = 2;
                  if(_loc5_.id == 370150)
                  {
                     this.anju = 1;
                  }
                  else if(_loc5_.id == 372028)
                  {
                     this.anju = 2;
                  }
                  else
                  {
                     this.anju = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_JIANGSHENG:
                  _loc4_.x = 1;
                  _loc4_.y = 42;
                  if(_loc5_.id == 370151)
                  {
                     this.jiangsheng = 1;
                  }
                  else if(_loc5_.id == 372029)
                  {
                     this.jiangsheng = 2;
                  }
                  else
                  {
                     this.jiangsheng = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_TIJU:
                  _loc4_.x = 161;
                  _loc4_.y = 2;
                  if(_loc5_.id == 370152)
                  {
                     this.jiaodeng = 1;
                  }
                  else if(_loc5_.id == 372030)
                  {
                     this.jiaodeng = 2;
                  }
                  else
                  {
                     this.jiaodeng = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_TITIE:
                  _loc4_.x = 161;
                  _loc4_.y = 43;
                  if(_loc5_.id == 370153)
                  {
                     this.tieti = 1;
                  }
                  else if(_loc5_.id == 372031)
                  {
                     this.tieti = 2;
                  }
                  else
                  {
                     this.tieti = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW1:
                  if(OtherConst.mount_add_count == 2)
                  {
                     _loc4_.x = 40 + 10;
                     _loc4_.y = 43;
                  }
                  else
                  {
                     _loc4_.x = 81;
                     _loc4_.y = 43;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW2:
                  if(OtherConst.mount_add_count == 2)
                  {
                     _loc4_.x = 120 - 10;
                     _loc4_.y = 43;
                  }
                  else
                  {
                     _loc4_.x = 40;
                     _loc4_.y = 43;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW3:
                  _loc4_.x = 120;
                  _loc4_.y = 43;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW4:
                  _loc4_.x = 40;
                  _loc4_.y = 2;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW5:
                  _loc4_.x = 120;
                  _loc4_.y = 2;
            }
            _loc2_++;
         }
      }
      
      private function setSkill(param1:Object) : void
      {
         var _loc3_:Skill = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:ItemFace = null;
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc2_.push(_loc3_);
         }
         if(_loc2_.length > 8)
         {
            _loc2_ = _loc2_.slice(0,8);
         }
         else
         {
            _loc2_ = _loc2_;
         }
         var _loc6_:int = int(_loc2_.length);
         _loc4_ = 0;
         loop2:
         while(_loc4_ < 2)
         {
            _loc5_ = 0;
            while(_loc5_ < 4)
            {
               if(_loc4_ * 4 + _loc5_ == _loc6_)
               {
                  break loop2;
               }
               _loc7_ = new ItemFace(_loc2_[_loc4_ * 4 + _loc5_] as BaseItem);
               if(_loc2_[_loc4_ * 4 + _loc5_] as MountSkill)
               {
                  if((_loc2_[_loc4_ * 4 + _loc5_] as MountSkill).lv <= 0)
                  {
                     _loc7_.setShowCount(false);
                  }
                  else
                  {
                     _loc7_.setShowCount(true);
                  }
               }
               this.skillContainer.addChild(_loc7_);
               _loc7_.x = _loc5_ * 49;
               _loc7_.y = _loc4_ * 40;
               _loc5_++;
            }
            _loc4_++;
         }
      }
      
      public function setTitle(param1:Boolean = true, param2:String = "", param3:String = "") : void
      {
         if(param2 != "")
         {
            this.title2.text = param2;
         }
         if(param3 != "")
         {
            this.title3.text = param3;
         }
      }
      
      public function setList(param1:XML, param2:String, param3:int, param4:int, param5:Boolean = false, param6:Boolean = false) : void
      {
         this.rankingList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.rankingList.setSelectItemByIndex(0);
            this.$parent.dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_PARTICULAR_INFO_SHOW,"",{
               "playerID":int(this.rankingList.selectItem.label),
               "mountID":int(this.rankingList.selectItem.mountID),
               "NO":int(this.rankingList.selectItem.NO)
            }));
         }
         this.pageCount.text = param3 + "/" + param4;
         this.homePageBtn.enabled = this.preBtn.enabled = !param5;
         this.endPageBtn.enabled = this.nextBtn.enabled = !param6;
         this.NOLabel.text = param2;
      }
      
      public function setItem(param1:Array, param2:Object, param3:BitmapData, param4:int, param5:String, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:Boolean, param17:int, param18:int, param19:int, param20:int) : void
      {
         var _loc23_:int = 0;
         var _loc25_:Bitmap = null;
         this.setEquip(param1);
         this.setSkill(param2);
         if(param4 == 0 && Boolean(this.chengHaoImg.bitmapData))
         {
            this.chengHaoImg.bitmapData.dispose();
         }
         else
         {
            this.chengHaoImg.bitmapData = StaticValue.getBitmapByClassName("ui.paihang.ph" + param4).bitmapData;
         }
         this.chengHaoImg.width = 120;
         this.chengHaoImg.height = 20.8;
         this.rideName.text = param6;
         this.savvy.text = param7.toString();
         this.attackBar.setValue(param8,param9,param17);
         this.recoveryBar.setValue(param10,param11,param18);
         this.lightBar.setValue(param12,param13,param19);
         this.healthBar.setValue(param14,param13,param20);
         while(this.valueContainer.numChildren > 0)
         {
            this.valueContainer.removeChildAt(0);
         }
         var _loc21_:String = (param8 + param10 + param12 + param14).toString();
         var _loc22_:Array = _loc21_.split("");
         var _loc24_:int = int(_loc22_.length);
         _loc23_ = 0;
         while(_loc23_ < _loc24_)
         {
            _loc25_ = StaticValue.getBitmapByClassName("ui.ride.value." + _loc22_[_loc23_]);
            this.valueContainer.addChild(_loc25_);
            _loc25_.x = _loc23_ * 7;
            _loc23_++;
         }
         _loc23_ = param17 + param18 + param19 + param20;
         if(_loc23_ == 0)
         {
            return;
         }
         _loc25_ = StaticValue.getBitmapByClassName("ui.ride.value.add");
         this.valueContainer.addChild(_loc25_);
         _loc25_.x = this.valueContainer.width + 7;
         _loc21_ = _loc23_.toString();
         _loc22_ = _loc21_.split("");
         _loc24_ = int(_loc22_.length);
         _loc23_ = 0;
         while(_loc23_ < _loc24_)
         {
            _loc25_ = StaticValue.getBitmapByClassName("ui.ride.value." + _loc22_[_loc23_]);
            this.valueContainer.addChild(_loc25_);
            _loc25_.x = this.valueContainer.width;
            _loc23_++;
         }
      }
      
      public function setAvatar(param1:BitmapData, param2:int) : void
      {
         while(this.headContainer.numChildren > 0)
         {
            this.headContainer.removeChildAt(0);
         }
         this.avatar = param1;
         if(param2 == 0)
         {
            return;
         }
         this.headImg = ResPathManager.getSmallICO(param2);
         this.headContainer.addChild(this.headImg);
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         var _loc2_:Rectangle = new Rectangle();
         if(!param1)
         {
            return;
         }
         if(this._avatar.width >= 512 && this._avatar.height >= 209)
         {
            _loc2_ = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
            if(_loc2_.width > 203)
            {
               this._avatar.scaleX = this._avatar.scaleY = 203 / _loc2_.width;
            }
            this._avatar.x = 290 - this._avatar.width / 2 - 270 + 80;
            this._avatar.y = 63 - this._avatar.height / 2 + 20;
         }
         else
         {
            _loc3_ = 1;
            if(this._avatar.height != 84)
            {
               _loc3_ = 84 / this._avatar.height;
            }
            _loc2_ = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
            this._avatar.bitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            this._avatar.bitmapData.copyPixels(param1,_loc2_,new Point(0,0));
            _loc4_ = 1;
            if(_loc2_.width > 148)
            {
               _loc4_ = 148 / _loc2_.width;
            }
            this._avatar.scaleX = this._avatar.scaleY = _loc3_ > _loc4_ ? _loc4_ : _loc3_;
            this._avatar.x = 286 - this._avatar.width / 2 - 270 + 100;
            this._avatar.y = 63 - this._avatar.height / 2 + 20;
         }
      }
      
      public function setDreamBarPercentage(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.dreamBar.setValue(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.dreamBar.setHeianGuangming(this.anju,this.jiangsheng,this.jiaodeng,this.tieti);
      }
   }
}

