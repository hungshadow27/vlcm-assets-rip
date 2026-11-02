package com.tgame.shell.view.components.rankinglist
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.RankingListPanel;
   import com.tgame.shell.view.components.attribute.EquipList;
   import com.tgame.shell.view.components.attribute.NbEquipCanvas;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class PlayerRankingListCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      public var ico:CharAttributeOccultIco;
      
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
      
      private var chonbaiCount:FLabel;
      
      private var bishiCount:FLabel;
      
      private var chongbaiBtn:SecondButton;
      
      private var bishiBtn:SecondButton;
      
      private var tips:FTextArea;
      
      private var chengHaoImg:Bitmap;
      
      private var flag:MovieClip;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var img:Bitmap;
      
      public var equipList:EquipList;
      
      public var nbEquipCanvas:NbEquipCanvas;
      
      private var yupei:ItemFace;
      
      public function PlayerRankingListCanvas()
      {
         var lb:FLabel;
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
         this.bgImg.name = "ui.ranklist.player.ui";
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.chengHaoImg = new Bitmap(new BitmapData(120,20.8,true,0));
         this.chengHaoImg.width = 120;
         this.chengHaoImg.height = 20.8;
         addChild(this.chengHaoImg);
         this.chengHaoImg.x = 266;
         this.chengHaoImg.y = 4;
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 225;
         this.equipContainer.y = 6;
         lb = new FLabel();
         with(lb)
         {
            x = 15;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanCommonTextWords("排名");
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
         this.title2.text = LanResManager.getLanTextWords(this,"姓名");
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
         this.title3.text = LanResManager.getLanTextWords(this,"等级");
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
         lb = new FLabel();
         with(lb)
         {
            x = 55;
            y = 255;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"您的当前排名") + "：";
         addChild(lb);
         this.NOLabel = new FLabel();
         with(this.NOLabel)
         {
            x = 130;
            y = 255;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "100";
         }
         addChild(this.NOLabel);
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanTextWords(this,"首页");
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
         this.endPageBtn.label = LanResManager.getLanTextWords(this,"尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = this.nextBtn.x + 27;
         this.endPageBtn.y = this.homePageBtn.y;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.chenghao = new FTextArea();
         with(this.chenghao)
         {
            x = 278;
            y = 14;
            width = 96;
            height = 40;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,null,StaticValue.YELLOW,null,null,null,null,null,"center");
            htmlText = "";
         }
         addChild(this.chenghao);
         this.tips = new FTextArea();
         with(this.tips)
         {
            x = 278;
            y = 100;
            width = 96;
            height = 40;
            defaultTextFormat = new TextFormat(null,null,StaticValue.YELLOW,null,null,null,null,null,"center");
            filters = StaticValue.filter;
            visible = false;
         }
         this.tips.text = LanResManager.getLanTextWords(this,"玩家不在线");
         addChild(this.tips);
         lb = new FLabel();
         with(lb)
         {
            x = 222;
            y = 255;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("被崇拜次数:　　　　被鄙视次数:");
         }
         lb.text = LanResManager.getLanTextWords(this,"崇拜鄙视次数");
         this.chonbaiCount = new FLabel();
         with(this.chonbaiCount)
         {
            x = 260;
            y = 255;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "9999";
         }
         this.bishiCount = new FLabel();
         with(this.bishiCount)
         {
            x = 383;
            y = 255;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "9999";
         }
         this.chongbaiBtn = new SecondButton();
         this.chongbaiBtn.label = LanResManager.getLanTextWords(this,"崇拜一下");
         this.chongbaiBtn.x = 246;
         this.chongbaiBtn.y = 282;
         this.chongbaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.bishiBtn = new SecondButton();
         this.bishiBtn.label = LanResManager.getLanTextWords(this,"鄙视一下");
         this.bishiBtn.x = width - 24 - this.bishiBtn.width;
         this.bishiBtn.y = 282;
         this.bishiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ico = new CharAttributeOccultIco();
         addChild(this.ico);
         this.ico.x = 358;
         this.ico.y = 15;
         this.equipList = new EquipList();
         this.equipList.x = 235;
         this.equipList.y = 265 - 5;
         this.equipList.$parent = this;
         this.equipList.$parent2 = this.$parent;
         this.equipList.setClickSta(false,true);
         addChild(this.equipList);
         this.nbEquipCanvas = new NbEquipCanvas();
         this.nbEquipCanvas.x = 442;
         this.nbEquipCanvas.y = -120;
         this.nbEquipCanvas.$parent = this;
         this.nbEquipCanvas.$parent2 = this.$parent;
         this.nbEquipCanvas.setClickSta(false,true);
         addChild(this.nbEquipCanvas);
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage,false,-int.MAX_VALUE);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         var _loc2_:Shape = new Shape();
         _loc2_.y = -200;
         _loc2_.graphics.beginFill(0,0);
         _loc2_.graphics.drawRect(-9999,0,999999,999999);
         _loc2_.graphics.endFill();
         addChild(_loc2_);
         this.mask = _loc2_;
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(!this.rankingList.selectItem)
         {
            return;
         }
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
               break;
            case this.chongbaiBtn:
               this.$parent.dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_MUTUAL,"",1));
               break;
            case this.bishiBtn:
               this.$parent.dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_MUTUAL,"",2));
         }
      }
      
      public function setShowItem(param1:Array) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:ItemFace = null;
         var _loc4_:Boolean = false;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.equipList.initEquipList();
         this.nbEquipCanvas.initEquipList();
         for each(_loc2_ in param1)
         {
            if(!(_loc2_.res.position == ItemPositionRange.POSTION_BOW || _loc2_.res.position == ItemPositionRange.POSTION_ZHENHUN))
            {
               _loc4_ = true;
               switch(_loc2_.res.position)
               {
                  case ItemPositionRange.POSTION_WUQI:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 0;
                     _loc3_.y = 0;
                     break;
                  case ItemPositionRange.POSTION_QIBING:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 0;
                     _loc3_.y = 41;
                     break;
                  case ItemPositionRange.POSTION_YIFU:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 0;
                     _loc3_.y = 82;
                     break;
                  case ItemPositionRange.POSTION_HUSHOU:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 0;
                     _loc3_.y = 123;
                     break;
                  case ItemPositionRange.POSTION_HUYAO:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 0;
                     _loc3_.y = 164;
                     break;
                  case ItemPositionRange.POSTION_HUXUE:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 0;
                     _loc3_.y = 205;
                     break;
                  case ItemPositionRange.POSTION_TOUSHI:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 168;
                     _loc3_.y = 0;
                     break;
                  case ItemPositionRange.POSTION_XIANGLIAN:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 168;
                     _loc3_.y = 41;
                     break;
                  case ItemPositionRange.POSTION_JIEZHI:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 168;
                     _loc3_.y = 82;
                     break;
                  case ItemPositionRange.POSTION_SHOUZHUO:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 168;
                     _loc3_.y = 123;
                     break;
                  case ItemPositionRange.POSTION_YAOZHUI:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 168;
                     _loc3_.y = 164;
                     break;
                  case ItemPositionRange.POSTION_PIFENG:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 168;
                     _loc3_.y = 205;
                     break;
                  case ItemPositionRange.POSTION_WULINGONGDIXUNZHANG:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 121;
                     _loc3_.y = 168;
                     break;
                  case ItemPositionRange.POSTION_TESHU:
                     _loc3_ = new ItemFace(_loc2_);
                     _loc3_.x = 84;
                     _loc3_.y = 205;
                     break;
                  case ItemPositionRange.POSTION_YLZR:
                  case ItemPositionRange.POSTION_STDRJ:
                  case ItemPositionRange.POSTION_AOJIAN:
                  case ItemPositionRange.POSTION_POJUN:
                  case ItemPositionRange.POSTION_GUXING_GUOFU:
                  case ItemPositionRange.POSITION_ZILINGHUANYUEJI_GUOFU:
                  case ItemPositionRange.POSITION_WUYINGJIAN_GUOFU:
                  case ItemPositionRange.POSITION_CHIYAN_GUOFU:
                  case ItemPositionRange.POSITION_TIANJING_GUOFU:
                  case ItemPositionRange.POSITION_HUOYUN_GUOFU:
                  case ItemPositionRange.POSTION_XINGTIAN_GUOFU:
                  case ItemPositionRange.POSTION_JINWUMINGGUANGTANG_GUOFU:
                  case ItemPositionRange.POSTION_LIETIANBAWANGJI_GUOFU:
                  case ItemPositionRange.POSTION_DAGOUBANG:
                  case ItemPositionRange.POSTION_XUANYUANDIJIAN_SHENQI:
                  case ItemPositionRange.POSTION_XUANYUANTIANJIAN_SHENQI:
                  case ItemPositionRange.POSTION_XUANYUANRENJIAN_SHENQI:
                  case ItemPositionRange.POSTION_GJMY:
                  case ItemPositionRange.POSTION_SHENQI:
                  case ItemPositionRange.POSITION_LONGYA:
                  case ItemPositionRange.POSITION_YAYUEDAO:
                  case ItemPositionRange.POSITION_XUANTIEZHONGJIAN:
                  case ItemPositionRange.POSITION_GUANGMINGZHANG:
                  case ItemPositionRange.POSITION_HUIMIE:
                  case ItemPositionRange.POSITION_CHIYAN:
                  case ItemPositionRange.POSITION_FENGTIANJI:
                  case ItemPositionRange.POSITION_HUOLONGDAO:
                  case ItemPositionRange.POSITION_TIANZHU:
                  case ItemPositionRange.POSITION_ZHUMOZHANG:
                  case ItemPositionRange.POSITION_TIANJING:
                  case ItemPositionRange.POSITION_PANGUKAITIANFU:
                  case ItemPositionRange.POSITION_TIANDI:
                  case ItemPositionRange.POSITION_HANQIBINGPO:
                  case ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN:
                  case ItemPositionRange.POSITION_CHUANGSHI:
                  case ItemPositionRange.POSITION_SUILIESHIFU:
                  case ItemPositionRange.POSITION_MOYUAN:
                  case ItemPositionRange.POSITION_FENGBAODAO:
                  case ItemPositionRange.POSITION_FENGYUN:
                  case ItemPositionRange.POSITION_SHENGDAN2015:
                  case ItemPositionRange.POSITION_FENGSHA:
                  case ItemPositionRange.POSITION_FENGYIJIAN:
                  case ItemPositionRange.POSITION_LEXINJI:
                  case ItemPositionRange.POSITION_FENGYINGJIAN:
                  case ItemPositionRange.POSITION_ZHENFENGJIAN:
                  case ItemPositionRange.POSITION_FENGYUNJIAN:
                  case ItemPositionRange.POSITION_BINGFENGJIAN:
                  case ItemPositionRange.POSITION_HONGLEIZHANGU:
                  case ItemPositionRange.POSITION_SANDENGGUFO:
                  case ItemPositionRange.POSITION_FONUJI:
                  case ItemPositionRange.POSITION_FENGYINJIAN:
                  case ItemPositionRange.POSITION_TIANMAJIAN:
                  case ItemPositionRange.POSITION_WUHUNJIAN:
                  case ItemPositionRange.POSITION_ZHENTIANJIAN:
                  case ItemPositionRange.POSITION_TIANXUE:
                  case ItemPositionRange.POSITION_XIONGJIJIAN:
                  case ItemPositionRange.POSITION_WUJINJIAN:
                  case ItemPositionRange.POSITION_SHUNTIANJIAN:
                  case ItemPositionRange.POSITION_WANGZHEQICANG:
                  case ItemPositionRange.POSITION_BIXUEJIAN:
                  case ItemPositionRange.POSITION_QINGFENGJIAN:
                  case ItemPositionRange.POSITION_HUOLINJIAN:
                  case ItemPositionRange.POSITION_BIYUDAO:
                  case ItemPositionRange.POSITION_WUWOZHANG:
                  case ItemPositionRange.POSITION_YEHUOHONGLIAN:
                  case ItemPositionRange.POSITION_MINGYUEDAO:
                  case ItemPositionRange.POSITION_QINGFENGJIAN2:
                  case ItemPositionRange.POSITION_ZHIZUNJIAN:
                  case ItemPositionRange.POSITION_BAOLEIJI:
                  case ItemPositionRange.POSITION_MINGSHENGZHANG:
                  case ItemPositionRange.POSITION_ZUNSHIJIAN:
                  case ItemPositionRange.POSITION_RENZHEZHANG:
                  case ItemPositionRange.POSITION_ZHIZHEJIAN:
                  case ItemPositionRange.POSITION_YANGMINGJIAN:
                  case ItemPositionRange.POSITION_XIWANGJIAN:
                  case ItemPositionRange.POSITION_XUEJINGJIAN:
                  case ItemPositionRange.POSITION_XUANBINGJIAN:
                  case ItemPositionRange.POSITION_PINGANJIAN:
                  case ItemPositionRange.POSITION_QINGHUAJIAN:
                  case ItemPositionRange.POSITION_YUXUJIAN:
                  case ItemPositionRange.POSITION_YUQINGSHAN:
                  case ItemPositionRange.POSITION_HUOMODAO:
                  case ItemPositionRange.POSITION_YIHEJI:
                  case ItemPositionRange.POSITION_ERHEJIAN:
                  case ItemPositionRange.POSITION_SANHEDAO:
                  case ItemPositionRange.POSITION_MIEHUSHAN:
                  case ItemPositionRange.POSITION_QINGMINGDAO:
                  case ItemPositionRange.POSITION_HUOXINGFU:
                  case ItemPositionRange.POSITION_SHENZAO:
                  case ItemPositionRange.POSITION_KAITIANGONG:
                  case ItemPositionRange.POSITION_YANWENFENGMO:
                  case ItemPositionRange.POSITION_LINGLONGZI:
                  case ItemPositionRange.POSITION_SHASHENJIAN:
                  case ItemPositionRange.POSITION_DUANQINGJI:
                  case ItemPositionRange.POSITION_NULONG:
                  case ItemPositionRange.POSITION_QINIAN:
                  case ItemPositionRange.POSITION_ZHUXIAN:
                  case ItemPositionRange.POSITION_HANBING:
                  case ItemPositionRange.POSITION_POSHAN:
                  case ItemPositionRange.POSITION_HAIYU:
                  case ItemPositionRange.POSITION_TIANMINGDAO:
                  case ItemPositionRange.POSITION_JINGTIANYIJI:
                  case ItemPositionRange.POSITION_JINGLEIJUEDAO:
                  case ItemPositionRange.POSITION_YINGXIONGJIAN:
                  case ItemPositionRange.POSITION_CHANGSHENGJIAN:
                  case ItemPositionRange.POSITION_GUIYINGGONG:
                  case ItemPositionRange.POSITION_JINGLEIZHANG:
                  case ItemPositionRange.POSITION_HUNDUN:
                  case ItemPositionRange.POSITION_DINGHUN:
                  case ItemPositionRange.POSITION_WUJI:
                  case ItemPositionRange.POSITION_HUOXINGJIAN:
                  case ItemPositionRange.POSITION_WANGZHEFU:
                  case ItemPositionRange.POSITION_DUOMINGDAO:
                  case ItemPositionRange.POSITION_XIAOSHEN:
                  case ItemPositionRange.POSITION_WANSHI:
                  case ItemPositionRange.POSITION_ZHONGQIU:
                  case ItemPositionRange.POSITION_SHENJIAN:
                  case ItemPositionRange.POSITION_YUHUAZHANG:
                  case ItemPositionRange.POSITION_BANIANGONG:
                  case ItemPositionRange.POSITION_BANIANJIAN:
                  case ItemPositionRange.POSITION_BANIANJI:
                  case ItemPositionRange.POSITION_2019SHENDAN:
                  case ItemPositionRange.POSITION_2019GENGZI:
                  case ItemPositionRange.POSITION_2019FEIHUA:
                  case ItemPositionRange.POSITION_2019XIONGWANG:
                  case ItemPositionRange.POSITION_2020XUEHUAN:
                  case ItemPositionRange.POSITION_2020BADAO:
                  case ItemPositionRange.POSITION_2020BAOJIAN01:
                  case ItemPositionRange.POSITION_2020BAOJIAN02:
                  case ItemPositionRange.POSITION_2020BAOJIAN03:
                  case ItemPositionRange.POSITION_2020BAOJIAN04:
                  case ItemPositionRange.POSITION_2020BAOJIAN05:
                  case ItemPositionRange.POSITION_2020BAOJIAN06:
                  case ItemPositionRange.POSITION_2020BAOJIAN07:
                  case ItemPositionRange.POSITION_2020BAOJIAN08:
                  case ItemPositionRange.POSITION_2020BAOJIAN09:
                  case ItemPositionRange.POSITION_2020BAOJIAN10:
                  case ItemPositionRange.POSITION_2020BAOJIAN11:
                  case ItemPositionRange.POSITION_2020BAOJIAN12:
                  case ItemPositionRange.POSITION_2020BAOJIAN13:
                  case ItemPositionRange.POSITION_2020BAOJIAN14:
                  case ItemPositionRange.POSITION_2020BAOJIAN15:
                  case ItemPositionRange.POSITION_2020BAOJIAN16:
                  case ItemPositionRange.POSITION_2020BAOJIAN17:
                  case ItemPositionRange.POSITION_2020BAOJIAN18:
                  case ItemPositionRange.POSITION_2020BAOJIAN19:
                  case ItemPositionRange.POSITION_2020BAOJIAN20:
                  case ItemPositionRange.POSITION_2020BAOJIAN21:
                  case ItemPositionRange.POSITION_2020BAOJIAN22:
                  case ItemPositionRange.POSITION_2020BAOJIAN23:
                  case ItemPositionRange.POSITION_2020BAOJIAN24:
                  case ItemPositionRange.POSITION_2020BAOJIAN25:
                  case ItemPositionRange.POSITION_2020BAOJIAN26:
                  case ItemPositionRange.POSITION_2020BAOJIAN27:
                  case ItemPositionRange.POSITION_2020BAOJIAN28:
                  case ItemPositionRange.POSITION_2020BAOJIAN29:
                  case ItemPositionRange.POSITION_2020BAOJIAN30:
                  case ItemPositionRange.POSITION_2020BAOJIAN31:
                  case ItemPositionRange.POSITION_2020BAOJIAN32:
                  case ItemPositionRange.POSITION_2020BAOJIAN33:
                  case ItemPositionRange.POSITION_2020BAOJIAN34:
                  case ItemPositionRange.POSITION_2020BAOJIAN35:
                  case ItemPositionRange.POSITION_2020BAOJIAN36:
                  case ItemPositionRange.POSITION_2020BAOJIAN37:
                  case ItemPositionRange.POSITION_2020BAOJIAN38:
                  case ItemPositionRange.POSITION_2020BAOJIAN39:
                  case ItemPositionRange.POSITION_2020BAOJIAN40:
                  case ItemPositionRange.POSITION_2020BAOJIAN41:
                  case ItemPositionRange.POSITION_2020BAOJIAN42:
                  case ItemPositionRange.POSITION_2020BAOJIAN43:
                  case ItemPositionRange.POSITION_2020BAOJIAN44:
                  case ItemPositionRange.POSITION_2020BAOJIAN45:
                  case ItemPositionRange.POSITION_2020BAOJIAN46:
                  case ItemPositionRange.POSITION_2020BAOJIAN47:
                  case ItemPositionRange.POSITION_2020BAOJIAN48:
                  case ItemPositionRange.POSITION_2020BAOJIAN49:
                  case ItemPositionRange.POSITION_2020BAOJIAN50:
                  case ItemPositionRange.POSITION_2020BAOJIAN51:
                  case ItemPositionRange.POSITION_2020BAOJIAN52:
                  case ItemPositionRange.POSITION_2020BAOJIAN53:
                  case ItemPositionRange.POSITION_2020BAOJIAN54:
                  case ItemPositionRange.POSITION_2020BAOJIAN55:
                  case ItemPositionRange.POSITION_2020BAOJIAN56:
                  case ItemPositionRange.POSITION_2020BAOJIAN57:
                  case ItemPositionRange.POSITION_2020BAOJIAN58:
                  case ItemPositionRange.POSITION_2020BAOJIAN59:
                  case ItemPositionRange.POSITION_2020BAOJIAN60:
                  case ItemPositionRange.POSITION_2020BAOJIAN61:
                  case ItemPositionRange.POSITION_2020BAOJIAN62:
                  case ItemPositionRange.POSITION_2020BAOJIAN63:
                  case ItemPositionRange.POSITION_2020BAOJIAN64:
                  case ItemPositionRange.POSITION_2020BAOJIAN65:
                  case ItemPositionRange.POSITION_2020BAOJIAN66:
                  case ItemPositionRange.POSITION_2020BAOJIAN67:
                  case ItemPositionRange.POSITION_2020BAOJIAN68:
                  case ItemPositionRange.POSITION_2020BAOJIAN69:
                  case ItemPositionRange.POSITION_WUYIJIAN:
                  case ItemPositionRange.POSITION_SHIJIANSHENQI:
                  case ItemPositionRange.POSITION_CHENGJIECHANGJI:
                  case ItemPositionRange.POSITION_TIANXIEJIAN:
                  case ItemPositionRange.POSITION_JUNZIJIAN:
                  case ItemPositionRange.POSITION_WANGZHEJIAN:
                  case ItemPositionRange.POSITION_SHENGXIAOSHENQI:
                  case ItemPositionRange.POSITION_ZHUIHUNJI:
                  case ItemPositionRange.POSITION_NB_WEAPON_ARR[0]:
                  case ItemPositionRange.POSITION_NB_WEAPON_ARR[1]:
                  case ItemPositionRange.POSITION_NB_WEAPON_ARR[2]:
                  case ItemPositionRange.POSITION_NB_WEAPON_ARR[3]:
                  case ItemPositionRange.POSITION_NB_WEAPON_ARR[4]:
                  case ItemPositionRange.POSITION_NB_WEAPON_ARR[5]:
                  case ItemPositionRange.POSITION_NB_WEAPON_ARR[6]:
                  case ItemPositionRange.POSITION_NB_WEAPON_ARR[7]:
                  case ItemPositionRange.POSITION_NB_WEAPON_ARR[8]:
                  case ItemPositionRange.POSITION_NB_WEAPON_ARR[9]:
                     this.nbEquipCanvas.addEuqip(_loc2_);
                     _loc4_ = false;
                     break;
                  case ItemPositionRange.POSTION_HUIZHANG:
                  case ItemPositionRange.POSTION_JINIANXUNZHANG:
                  case ItemPositionRange.POSTION_KUAPINGTAI_BIWU_XUNZHANG:
                  case ItemPositionRange.POSTION_ZHUANGBEIWEIZHI1:
                  case ItemPositionRange.POSTION_ZHUANGBEIWEIZHI2:
                  case ItemPositionRange.POSTION_DWJSHUIZHANG:
                     this.equipList.addEuqip(_loc2_);
                     _loc4_ = false;
                     break;
                  default:
                     _loc4_ = false;
               }
               if(_loc2_.res.position >= ItemPositionRange.POSTION_XUNZHANG_2018_ARR.x && _loc2_.res.position <= ItemPositionRange.POSTION_XUNZHANG_2018_ARR.y || (_loc2_.res.position >= ItemPositionRange.POSTION_HUODONG_ARR.x && _loc2_.res.position <= ItemPositionRange.POSTION_HUODONG_ARR.y || _loc2_.res.position >= ItemPositionRange.POSTION_HUODONG_ARR1.x && _loc2_.res.position <= ItemPositionRange.POSTION_HUODONG_ARR1.y || _loc2_.res.position >= ItemPositionRange.POSTION_HUIZHANG_ARR.x && _loc2_.res.position <= ItemPositionRange.POSTION_HUIZHANG_ARR.y || _loc2_.res.position >= ItemPositionRange.POSTION_HUODONG_ZHUANGBEI_ARR.x && _loc2_.res.position <= ItemPositionRange.POSTION_HUODONG_ZHUANGBEI_ARR.y || _loc2_.res.position >= ItemPositionRange.POSTION_XUNZHANG_ARR0.x && _loc2_.res.position <= ItemPositionRange.POSTION_XUNZHANG_ARR0.y) && ItemPositionRange.POSITION_ATTRIBUTE_NO_ARR.indexOf(_loc2_.res.position) == -1)
               {
                  this.equipList.addEuqip(_loc2_);
                  _loc4_ = false;
               }
               if(_loc4_)
               {
                  _loc3_.showRedMask();
                  _loc3_.showStrengthenLv = true;
                  _loc3_.name = String(_loc2_.res.position);
                  this.equipContainer.addChild(_loc3_);
               }
            }
         }
         this.equipList.setEquipItem();
         this.nbEquipCanvas.setEquipItem();
      }
      
      private function resizeXuanyuanjianYlzr() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObject = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:DisplayObject = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:DisplayObject = null;
         var _loc10_:DisplayObject = null;
         var _loc11_:DisplayObject = null;
         var _loc12_:DisplayObject = null;
         var _loc13_:DisplayObject = null;
         var _loc14_:DisplayObject = null;
         var _loc15_:DisplayObject = null;
         var _loc16_:DisplayObject = null;
         var _loc17_:DisplayObject = null;
         var _loc18_:DisplayObject = null;
         var _loc19_:DisplayObject = null;
         var _loc20_:DisplayObject = null;
         var _loc21_:DisplayObject = null;
         var _loc22_:DisplayObject = null;
         var _loc23_:DisplayObject = null;
         var _loc24_:DisplayObject = null;
         var _loc25_:DisplayObject = null;
         var _loc26_:DisplayObject = null;
         var _loc27_:DisplayObject = null;
         var _loc28_:DisplayObject = null;
         var _loc29_:DisplayObject = null;
         var _loc30_:DisplayObject = null;
         var _loc31_:DisplayObject = null;
         var _loc32_:DisplayObject = null;
         var _loc33_:DisplayObject = null;
         var _loc34_:DisplayObject = null;
         var _loc35_:DisplayObject = null;
         var _loc36_:DisplayObject = null;
         var _loc37_:DisplayObject = null;
         var _loc38_:DisplayObject = null;
         var _loc39_:DisplayObject = null;
         var _loc40_:DisplayObject = null;
         var _loc41_:DisplayObject = null;
         var _loc42_:DisplayObject = null;
         var _loc43_:DisplayObject = null;
         var _loc44_:DisplayObject = null;
         var _loc45_:DisplayObject = null;
         var _loc46_:DisplayObject = null;
         var _loc47_:DisplayObject = null;
         var _loc48_:DisplayObject = null;
         var _loc49_:DisplayObject = null;
         var _loc50_:DisplayObject = null;
         var _loc51_:DisplayObject = null;
         var _loc52_:DisplayObject = null;
         var _loc53_:DisplayObject = null;
         var _loc54_:DisplayObject = null;
         var _loc55_:DisplayObject = null;
         var _loc56_:DisplayObject = null;
         var _loc57_:DisplayObject = null;
         var _loc58_:DisplayObject = null;
         var _loc59_:DisplayObject = null;
         var _loc60_:DisplayObject = null;
         var _loc61_:DisplayObject = null;
         var _loc62_:DisplayObject = null;
         var _loc63_:DisplayObject = null;
         var _loc64_:DisplayObject = null;
         var _loc65_:DisplayObject = null;
         var _loc66_:DisplayObject = null;
         var _loc67_:DisplayObject = null;
         var _loc68_:DisplayObject = null;
         var _loc69_:DisplayObject = null;
         var _loc70_:DisplayObject = null;
         var _loc71_:DisplayObject = null;
         var _loc72_:DisplayObject = null;
         var _loc73_:DisplayObject = null;
         var _loc74_:DisplayObject = null;
         var _loc75_:DisplayObject = null;
         var _loc76_:DisplayObject = null;
         var _loc77_:DisplayObject = null;
         var _loc78_:DisplayObject = null;
         var _loc79_:DisplayObject = null;
         var _loc80_:DisplayObject = null;
         var _loc81_:DisplayObject = null;
         var _loc82_:DisplayObject = null;
         var _loc83_:DisplayObject = null;
         var _loc84_:DisplayObject = null;
         var _loc85_:DisplayObject = null;
         var _loc86_:DisplayObject = null;
         var _loc87_:DisplayObject = null;
         var _loc88_:DisplayObject = null;
         var _loc89_:DisplayObject = null;
         var _loc90_:DisplayObject = null;
         var _loc91_:DisplayObject = null;
         var _loc92_:DisplayObject = null;
         var _loc93_:DisplayObject = null;
         var _loc94_:DisplayObject = null;
         var _loc95_:DisplayObject = null;
         var _loc96_:DisplayObject = null;
         var _loc97_:DisplayObject = null;
         var _loc98_:DisplayObject = null;
         var _loc99_:DisplayObject = null;
         var _loc100_:DisplayObject = null;
         var _loc101_:DisplayObject = null;
         var _loc102_:DisplayObject = null;
         var _loc103_:DisplayObject = null;
         var _loc104_:DisplayObject = null;
         var _loc105_:DisplayObject = null;
         var _loc106_:DisplayObject = null;
         var _loc107_:DisplayObject = null;
         var _loc108_:DisplayObject = null;
         var _loc109_:DisplayObject = null;
         var _loc110_:DisplayObject = null;
         var _loc111_:DisplayObject = null;
         var _loc112_:DisplayObject = null;
         var _loc113_:DisplayObject = null;
         var _loc114_:DisplayObject = null;
         var _loc115_:DisplayObject = null;
         var _loc116_:DisplayObject = null;
         var _loc117_:DisplayObject = null;
         var _loc118_:DisplayObject = null;
         var _loc119_:DisplayObject = null;
         var _loc120_:DisplayObject = null;
         var _loc121_:DisplayObject = null;
         var _loc122_:DisplayObject = null;
         var _loc123_:DisplayObject = null;
         var _loc124_:DisplayObject = null;
         var _loc125_:DisplayObject = null;
         var _loc126_:DisplayObject = null;
         var _loc127_:DisplayObject = null;
         var _loc128_:DisplayObject = null;
         var _loc129_:DisplayObject = null;
         var _loc130_:DisplayObject = null;
         var _loc131_:DisplayObject = null;
         var _loc132_:DisplayObject = null;
         var _loc133_:DisplayObject = null;
         var _loc134_:DisplayObject = null;
         var _loc135_:DisplayObject = null;
         var _loc136_:DisplayObject = null;
         var _loc137_:DisplayObject = null;
         var _loc138_:DisplayObject = null;
         var _loc139_:DisplayObject = null;
         var _loc140_:DisplayObject = null;
         var _loc141_:DisplayObject = null;
         var _loc142_:DisplayObject = null;
         var _loc143_:DisplayObject = null;
         var _loc144_:DisplayObject = null;
         var _loc145_:DisplayObject = null;
         var _loc146_:DisplayObject = null;
         var _loc147_:DisplayObject = null;
         var _loc148_:DisplayObject = null;
         var _loc149_:DisplayObject = null;
         var _loc150_:DisplayObject = null;
         var _loc151_:DisplayObject = null;
         var _loc152_:DisplayObject = null;
         var _loc153_:DisplayObject = null;
         var _loc154_:DisplayObject = null;
         var _loc155_:DisplayObject = null;
         var _loc156_:DisplayObject = null;
         var _loc157_:DisplayObject = null;
         var _loc158_:DisplayObject = null;
         var _loc159_:DisplayObject = null;
         var _loc160_:DisplayObject = null;
         var _loc161_:DisplayObject = null;
         var _loc162_:DisplayObject = null;
         var _loc163_:DisplayObject = null;
         var _loc164_:DisplayObject = null;
         var _loc165_:DisplayObject = null;
         var _loc166_:DisplayObject = null;
         var _loc167_:DisplayObject = null;
         var _loc168_:DisplayObject = null;
         var _loc169_:DisplayObject = null;
         var _loc170_:DisplayObject = null;
         var _loc171_:DisplayObject = null;
         var _loc172_:DisplayObject = null;
         var _loc173_:DisplayObject = null;
         var _loc174_:DisplayObject = null;
         var _loc175_:DisplayObject = null;
         var _loc176_:DisplayObject = null;
         var _loc177_:DisplayObject = null;
         var _loc178_:DisplayObject = null;
         var _loc179_:DisplayObject = null;
         var _loc180_:DisplayObject = null;
         var _loc181_:DisplayObject = null;
         var _loc182_:DisplayObject = null;
         var _loc183_:DisplayObject = null;
         var _loc184_:DisplayObject = null;
         var _loc185_:DisplayObject = null;
         var _loc186_:DisplayObject = null;
         var _loc187_:DisplayObject = null;
         var _loc188_:DisplayObject = null;
         var _loc189_:DisplayObject = null;
         var _loc190_:DisplayObject = null;
         var _loc191_:DisplayObject = null;
         var _loc192_:DisplayObject = null;
         var _loc193_:DisplayObject = null;
         var _loc194_:DisplayObject = null;
         var _loc195_:DisplayObject = null;
         var _loc196_:DisplayObject = null;
         var _loc197_:DisplayObject = null;
         var _loc198_:DisplayObject = null;
         var _loc199_:DisplayObject = null;
         var _loc200_:int = 0;
         var _loc201_:int = 0;
         var _loc202_:int = 0;
         var _loc203_:Array = null;
         var _loc204_:int = 0;
         var _loc205_:int = 0;
         var _loc206_:DisplayObject = null;
         _loc1_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_SHENQI));
         _loc2_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_YLZR));
         _loc3_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_STDRJ));
         _loc4_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_AOJIAN));
         _loc5_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_GJMY));
         _loc6_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_LONGYA));
         _loc7_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YAYUEDAO));
         _loc8_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XUANTIEZHONGJIAN));
         _loc9_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_GUANGMINGZHANG));
         _loc10_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUIMIE));
         _loc11_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHUMOZHANG));
         _loc12_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_CHIYAN));
         _loc13_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANJING));
         _loc14_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGTIANJI));
         _loc15_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOLONGDAO));
         _loc16_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_POJUN));
         _loc17_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_DAGOUBANG));
         _loc8_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_XUANTIEZHONGJIAN));
         _loc18_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_XINGTIAN_GUOFU));
         _loc19_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_GUXING_GUOFU));
         _loc20_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_JINWUMINGGUANGTANG_GUOFU));
         _loc21_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_LIETIANBAWANGJI_GUOFU));
         _loc22_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZILINGHUANYUEJI_GUOFU));
         _loc23_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUYINGJIAN_GUOFU));
         _loc24_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHENGXIAOSHENQI));
         _loc25_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOYUN_GUOFU));
         _loc26_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANZHU));
         _loc27_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_PANGUKAITIANFU));
         _loc28_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANDI));
         _loc29_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HANQIBINGPO));
         _loc30_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN));
         _loc31_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_CHUANGSHI));
         _loc32_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SUILIESHIFU));
         _loc33_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_MOYUAN));
         _loc34_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_CHENGJIECHANGJI));
         _loc35_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANXIEJIAN));
         _loc36_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_JUNZIJIAN));
         _loc37_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WANGZHEJIAN));
         _loc38_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGBAODAO));
         _loc39_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGYUN));
         _loc40_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHENGDAN2015));
         _loc41_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGSHA));
         _loc42_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGYIJIAN));
         _loc43_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_LEXINJI));
         _loc44_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGYINGJIAN));
         _loc45_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHENFENGJIAN));
         _loc46_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGYUNJIAN));
         _loc47_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BINGFENGJIAN));
         _loc48_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HONGLEIZHANGU));
         _loc49_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SANDENGGUFO));
         _loc50_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FONUJI));
         _loc51_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGYINJIAN));
         _loc52_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANMAJIAN));
         _loc53_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUHUNJIAN));
         _loc54_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHENTIANJIAN));
         _loc55_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANXUE));
         _loc56_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XIONGJIJIAN));
         _loc57_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUJINJIAN));
         _loc58_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHUNTIANJIAN));
         _loc59_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WANGZHEQICANG));
         _loc60_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BIXUEJIAN));
         _loc61_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUYIJIAN));
         _loc62_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHIJIANSHENQI));
         _loc63_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_QINGFENGJIAN));
         _loc64_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOLINJIAN));
         _loc65_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHUIHUNJI));
         _loc66_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BIYUDAO));
         _loc67_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUWOZHANG));
         _loc68_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YEHUOHONGLIAN));
         _loc69_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_MINGYUEDAO));
         _loc70_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_QINGFENGJIAN2));
         _loc71_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHIZUNJIAN));
         _loc72_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BAOLEIJI));
         _loc73_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_MINGSHENGZHANG));
         _loc74_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZUNSHIJIAN));
         _loc75_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_RENZHEZHANG));
         _loc76_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHIZHEJIAN));
         _loc77_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YANGMINGJIAN));
         _loc78_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XIWANGJIAN));
         _loc79_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XUEJINGJIAN));
         _loc80_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XUANBINGJIAN));
         _loc81_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_PINGANJIAN));
         _loc82_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_QINGHUAJIAN));
         _loc83_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YUXUJIAN));
         _loc84_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YUQINGSHAN));
         _loc85_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOMODAO));
         _loc86_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YIHEJI));
         _loc87_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ERHEJIAN));
         _loc88_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SANHEDAO));
         _loc89_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_MIEHUSHAN));
         _loc90_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_QINGMINGDAO));
         _loc91_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOXINGFU));
         _loc92_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHENZAO));
         _loc93_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_KAITIANGONG));
         _loc94_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YANWENFENGMO));
         _loc95_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_LINGLONGZI));
         _loc96_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHASHENJIAN));
         _loc97_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_DUANQINGJI));
         _loc98_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_NULONG));
         _loc99_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_QINIAN));
         _loc100_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHUXIAN));
         _loc101_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HANBING));
         _loc102_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_POSHAN));
         _loc103_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HAIYU));
         _loc104_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANMINGDAO));
         _loc105_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_JINGTIANYIJI));
         _loc106_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_JINGLEIJUEDAO));
         _loc107_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YINGXIONGJIAN));
         _loc108_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_CHANGSHENGJIAN));
         _loc109_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_GUIYINGGONG));
         _loc110_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_JINGLEIZHANG));
         _loc111_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUNDUN));
         _loc112_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_DINGHUN));
         _loc113_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUJI));
         _loc114_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOXINGJIAN));
         _loc115_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WANGZHEFU));
         _loc116_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_DUOMINGDAO));
         _loc117_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XIAOSHEN));
         _loc118_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WANSHI));
         _loc119_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHONGQIU));
         _loc120_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHENJIAN));
         _loc121_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YUHUAZHANG));
         _loc122_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BANIANGONG));
         _loc123_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BANIANJIAN));
         _loc124_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BANIANJI));
         _loc125_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2019SHENDAN));
         _loc126_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2019GENGZI));
         _loc127_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2019FEIHUA));
         _loc128_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2019XIONGWANG));
         _loc129_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020XUEHUAN));
         _loc130_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BADAO));
         _loc131_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN01));
         _loc132_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN02));
         _loc133_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN03));
         _loc134_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN04));
         _loc135_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN05));
         _loc136_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN06));
         _loc137_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN07));
         _loc138_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN08));
         _loc139_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN09));
         _loc140_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN10));
         _loc141_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN11));
         _loc142_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN12));
         _loc143_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN13));
         _loc144_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN14));
         _loc145_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN15));
         _loc146_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN16));
         _loc147_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN17));
         _loc148_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN18));
         _loc149_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN19));
         _loc150_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN20));
         _loc151_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN21));
         _loc152_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN22));
         _loc153_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN23));
         _loc154_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN24));
         _loc155_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN25));
         _loc156_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN26));
         _loc157_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN27));
         _loc158_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN28));
         _loc159_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN29));
         _loc160_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN30));
         _loc161_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN31));
         _loc162_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN32));
         _loc163_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN33));
         _loc164_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN34));
         _loc165_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN35));
         _loc166_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN36));
         _loc167_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN37));
         _loc168_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN38));
         _loc169_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN39));
         _loc170_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN40));
         _loc171_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN41));
         _loc172_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN42));
         _loc173_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN43));
         _loc174_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN44));
         _loc175_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN45));
         _loc176_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN46));
         _loc177_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN47));
         _loc178_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN48));
         _loc179_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN49));
         _loc180_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN50));
         _loc181_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN51));
         _loc182_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN52));
         _loc183_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN53));
         _loc184_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN54));
         _loc185_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN55));
         _loc186_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN56));
         _loc187_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN57));
         _loc188_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN58));
         _loc189_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN59));
         _loc190_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN60));
         _loc191_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN61));
         _loc192_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN62));
         _loc193_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN63));
         _loc194_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN64));
         _loc195_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN65));
         _loc196_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN66));
         _loc197_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN67));
         _loc198_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN68));
         _loc199_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN69));
         _loc200_ = 36;
         _loc201_ = 0;
         _loc202_ = 0;
         _loc203_ = [];
         _loc204_ = 0;
         while(_loc204_ < ItemPositionRange.POSITION_NB_WEAPON_ARR.length)
         {
            _loc206_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_NB_WEAPON_ARR[_loc204_]));
            if(_loc206_)
            {
               _loc203_.push(_loc206_);
            }
            _loc204_++;
         }
         _loc205_ = 0;
         while(_loc205_ < _loc203_.length)
         {
            if(_loc203_[_loc205_])
            {
               if(_loc201_ > 5)
               {
                  _loc203_[_loc205_].x = 272 - 226 + 36;
                  _loc203_[_loc205_].y = 211 - 6 - _loc200_ * _loc202_ - 36;
                  _loc202_++;
               }
               else
               {
                  _loc203_[_loc205_].x = 272 - 226;
                  _loc203_[_loc205_].y = 211 - 6 - _loc200_ * _loc201_;
                  _loc201_++;
               }
            }
            _loc205_++;
         }
         if(_loc1_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc1_.x = 272 - 226 + 36;
               _loc1_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc1_.x = 272 - 226;
               _loc1_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc2_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc2_.x = 272 - 226 + 36;
               _loc2_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc2_.x = 272 - 226;
               _loc2_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc3_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc3_.x = 272 - 226 + 36;
               _loc3_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc3_.x = 272 - 226;
               _loc3_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc4_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc4_.x = 272 - 226 + 36;
               _loc4_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc4_.x = 272 - 226;
               _loc4_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc5_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc5_.x = 272 - 226 + 36;
               _loc5_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc5_.x = 272 - 226;
               _loc5_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc6_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc6_.x = 272 - 226 + 36;
               _loc6_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc6_.x = 272 - 226;
               _loc6_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc7_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc7_.x = 272 - 226 + 36;
               _loc7_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc7_.x = 272 - 226;
               _loc7_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc16_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc16_.x = 272 - 226 + 36;
               _loc16_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc16_.x = 272 - 226;
               _loc16_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc17_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc17_.x = 272 - 226 + 36;
               _loc17_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc17_.x = 272 - 226;
               _loc17_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc8_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc8_.x = 272 - 226 + 36;
               _loc8_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc8_.x = 272 - 226;
               _loc8_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc18_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc18_.x = 272 - 226 + 36;
               _loc18_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc18_.x = 272 - 226;
               _loc18_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc19_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc19_.x = 272 - 226 + 36;
               _loc19_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc19_.x = 272 - 226;
               _loc19_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc20_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc20_.x = 272 - 226 + 36;
               _loc20_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc20_.x = 272 - 226;
               _loc20_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc21_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc21_.x = 272 - 226 + 36;
               _loc21_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc21_.x = 272 - 226;
               _loc21_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc22_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc22_.x = 272 - 226 + 36;
               _loc22_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc22_.x = 272 - 226;
               _loc22_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc23_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc23_.x = 272 - 226 + 36;
               _loc23_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc23_.x = 272 - 226;
               _loc23_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc12_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc12_.x = 272 - 226 + 36;
               _loc12_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc12_.x = 272 - 226;
               _loc12_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc24_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc24_.x = 272 - 226 + 36;
               _loc24_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc24_.x = 272 - 226;
               _loc24_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc8_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc8_.x = 272 - 226 + 36;
               _loc8_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc8_.x = 272 - 226;
               _loc8_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc9_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc9_.x = 272 - 226 + 36;
               _loc9_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc9_.x = 272 - 226;
               _loc9_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc10_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc10_.x = 272 - 226 + 36;
               _loc10_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc10_.x = 272 - 226;
               _loc10_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc11_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc11_.x = 272 - 226 + 36;
               _loc11_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc11_.x = 272 - 226;
               _loc11_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc12_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc12_.x = 272 - 226 + 36;
               _loc12_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc12_.x = 272 - 226;
               _loc12_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc13_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc13_.x = 272 - 226 + 36;
               _loc13_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc13_.x = 272 - 226;
               _loc13_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc14_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc14_.x = 272 - 226 + 36;
               _loc14_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc14_.x = 272 - 226;
               _loc14_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc15_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc15_.x = 272 - 226 + 36;
               _loc15_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc15_.x = 272 - 226;
               _loc15_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc13_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc13_.x = 272 - 226 + 36;
               _loc13_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc13_.x = 272 - 226;
               _loc13_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc25_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc25_.x = 272 - 226 + 36;
               _loc25_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc25_.x = 272 - 226;
               _loc25_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc26_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc26_.x = 272 - 226 + 36;
               _loc26_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc26_.x = 272 - 226;
               _loc26_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc27_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc27_.x = 272 - 226 + 36;
               _loc27_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc27_.x = 272 - 226;
               _loc27_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc28_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc28_.x = 272 - 226 + 36;
               _loc28_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc28_.x = 272 - 226;
               _loc28_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc29_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc29_.x = 272 - 226 + 36;
               _loc29_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc29_.x = 272 - 226;
               _loc29_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc30_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc30_.x = 272 - 226 + 36;
               _loc30_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc30_.x = 272 - 226;
               _loc30_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc31_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc31_.x = 272 - 226 + 36;
               _loc31_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc31_.x = 272 - 226;
               _loc31_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc32_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc32_.x = 272 - 226 + 36;
               _loc32_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc32_.x = 272 - 226;
               _loc32_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc33_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc33_.x = 272 - 226 + 36;
               _loc33_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc33_.x = 272 - 226;
               _loc33_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc34_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc34_.x = 272 - 226 + 36;
               _loc34_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc34_.x = 272 - 226;
               _loc34_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc35_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc35_.x = 272 - 226 + 36;
               _loc35_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc35_.x = 272 - 226;
               _loc35_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc36_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc36_.x = 272 - 226 + 36;
               _loc36_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc36_.x = 272 - 226;
               _loc36_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc37_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc37_.x = 272 - 226 + 36;
               _loc37_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc37_.x = 272 - 226;
               _loc37_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc38_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc38_.x = 272 - 226 + 36;
               _loc38_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc38_.x = 272 - 226;
               _loc38_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc39_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc39_.x = 60 - 13 + 36;
               _loc39_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc39_.x = 60 - 13;
               _loc39_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc40_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc40_.x = 60 - 13 + 36;
               _loc40_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc40_.x = 60 - 13;
               _loc40_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc41_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc41_.x = 60 - 13 + 36;
               _loc41_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc41_.x = 60 - 13;
               _loc41_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc42_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc42_.x = 60 - 13 + 36;
               _loc42_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc42_.x = 60 - 13;
               _loc42_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc43_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc43_.x = 60 - 13 + 36;
               _loc43_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc43_.x = 60 - 13;
               _loc43_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc44_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc44_.x = 60 - 13 + 36;
               _loc44_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc44_.x = 60 - 13;
               _loc44_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc45_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc45_.x = 60 - 13 + 36;
               _loc45_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc45_.x = 60 - 13;
               _loc45_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc46_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc46_.x = 60 - 13 + 36;
               _loc46_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc46_.x = 60 - 13;
               _loc46_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc47_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc47_.x = 60 - 13 + 36;
               _loc47_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc47_.x = 60 - 13;
               _loc47_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc48_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc48_.x = 60 - 13 + 36;
               _loc48_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc48_.x = 60 - 13;
               _loc48_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc49_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc49_.x = 60 - 13 + 36;
               _loc49_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc49_.x = 60 - 13;
               _loc49_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc50_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc50_.x = 60 - 13 + 36;
               _loc50_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc50_.x = 60 - 13;
               _loc50_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc51_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc51_.x = 60 - 13 + 36;
               _loc51_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc51_.x = 60 - 13;
               _loc51_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc52_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc52_.x = 60 - 13 + 36;
               _loc52_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc52_.x = 60 - 13;
               _loc52_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc53_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc53_.x = 60 - 13 + 36;
               _loc53_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc53_.x = 60 - 13;
               _loc53_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc54_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc54_.x = 60 - 13 + 36;
               _loc54_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc54_.x = 60 - 13;
               _loc54_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc55_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc55_.x = 60 - 13 + 36;
               _loc55_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc55_.x = 60 - 13;
               _loc55_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc56_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc56_.x = 60 - 13 + 36;
               _loc56_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc56_.x = 60 - 13;
               _loc56_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc57_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc57_.x = 60 - 13 + 36;
               _loc57_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc57_.x = 60 - 13;
               _loc57_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc58_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc58_.x = 60 - 13 + 36;
               _loc58_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc58_.x = 60 - 13;
               _loc58_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc59_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc59_.x = 60 - 13 + 36;
               _loc59_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc59_.x = 60 - 13;
               _loc59_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc60_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc60_.x = 60 - 13 + 36;
               _loc60_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc60_.x = 60 - 13;
               _loc60_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc61_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc61_.x = 60 - 13 + 36;
               _loc61_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc61_.x = 60 - 13;
               _loc61_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc62_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc62_.x = 60 - 13 + 36;
               _loc62_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc62_.x = 60 - 13;
               _loc62_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc63_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc63_.x = 60 - 13 + 36;
               _loc63_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc63_.x = 60 - 13;
               _loc63_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc64_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc64_.x = 60 - 13 + 36;
               _loc64_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc64_.x = 60 - 13;
               _loc64_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc65_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc65_.x = 60 - 13 + 36;
               _loc65_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc65_.x = 60 - 13;
               _loc65_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc66_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc66_.x = 60 - 13 + 36;
               _loc66_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc66_.x = 60 - 13;
               _loc66_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc67_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc67_.x = 60 - 13 + 36;
               _loc67_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc67_.x = 60 - 13;
               _loc67_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc68_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc68_.x = 60 - 13 + 36;
               _loc68_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc68_.x = 60 - 13;
               _loc68_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc69_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc69_.x = 60 - 13 + 36;
               _loc69_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc69_.x = 60 - 13;
               _loc69_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc70_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc70_.x = 60 - 13 + 36;
               _loc70_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc70_.x = 60 - 13;
               _loc70_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc71_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc71_.x = 60 - 13 + 36;
               _loc71_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc71_.x = 60 - 13;
               _loc71_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc72_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc72_.x = 60 - 13 + 36;
               _loc72_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc72_.x = 60 - 13;
               _loc72_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc73_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc73_.x = 60 - 13 + 36;
               _loc73_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc73_.x = 60 - 13;
               _loc73_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc74_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc74_.x = 60 - 13 + 36;
               _loc74_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc74_.x = 60 - 13;
               _loc74_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc75_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc75_.x = 60 - 13 + 36;
               _loc75_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc75_.x = 60 - 13;
               _loc75_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc76_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc76_.x = 60 - 13 + 36;
               _loc76_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc76_.x = 60 - 13;
               _loc76_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc77_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc77_.x = 60 - 13 + 36;
               _loc77_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc77_.x = 60 - 13;
               _loc77_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc78_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc78_.x = 60 - 13 + 36;
               _loc78_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc78_.x = 60 - 13;
               _loc78_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc79_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc79_.x = 60 - 13 + 36;
               _loc79_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc79_.x = 60 - 13;
               _loc79_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc80_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc80_.x = 60 - 13 + 36;
               _loc80_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc80_.x = 60 - 13;
               _loc80_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc81_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc81_.x = 60 - 13 + 36;
               _loc81_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc81_.x = 60 - 13;
               _loc81_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc82_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc82_.x = 60 - 13 + 36;
               _loc82_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc82_.x = 60 - 13;
               _loc82_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc83_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc83_.x = 60 - 13 + 36;
               _loc83_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc83_.x = 60 - 13;
               _loc83_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc84_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc84_.x = 60 - 13 + 36;
               _loc84_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc84_.x = 60 - 13;
               _loc84_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc85_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc85_.x = 60 - 13 + 36;
               _loc85_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc85_.x = 60 - 13;
               _loc85_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc86_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc86_.x = 60 - 13 + 36;
               _loc86_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc86_.x = 60 - 13;
               _loc86_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc87_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc87_.x = 60 - 13 + 36;
               _loc87_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc87_.x = 60 - 13;
               _loc87_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc88_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc88_.x = 60 - 13 + 36;
               _loc88_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc88_.x = 60 - 13;
               _loc88_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc89_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc89_.x = 60 - 13 + 36;
               _loc89_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc89_.x = 60 - 13;
               _loc89_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc90_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc90_.x = 60 - 13 + 36;
               _loc90_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc90_.x = 60 - 13;
               _loc90_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc91_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc91_.x = 60 - 13 + 36;
               _loc91_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc91_.x = 60 - 13;
               _loc91_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc92_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc92_.x = 60 - 13 + 36;
               _loc92_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc92_.x = 60 - 13;
               _loc92_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc93_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc93_.x = 60 - 13 + 36;
               _loc93_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc93_.x = 60 - 13;
               _loc93_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc94_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc94_.x = 60 - 13 + 36;
               _loc94_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc94_.x = 60 - 13;
               _loc94_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc95_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc95_.x = 60 - 13 + 36;
               _loc95_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc95_.x = 60 - 13;
               _loc95_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc96_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc96_.x = 60 - 13 + 36;
               _loc96_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc96_.x = 60 - 13;
               _loc96_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc121_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc121_.x = 60 - 13 + 36;
               _loc121_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc121_.x = 60 - 13;
               _loc121_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc122_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc122_.x = 60 - 13 + 36;
               _loc122_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc122_.x = 60 - 13;
               _loc122_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc123_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc123_.x = 60 - 13 + 36;
               _loc123_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc123_.x = 60 - 13;
               _loc123_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc124_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc124_.x = 60 - 13 + 36;
               _loc124_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc124_.x = 60 - 13;
               _loc124_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc125_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc125_.x = 60 - 13 + 36;
               _loc125_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc125_.x = 60 - 13;
               _loc125_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc126_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc126_.x = 60 - 13 + 36;
               _loc126_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc126_.x = 60 - 13;
               _loc126_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc127_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc127_.x = 60 - 13 + 36;
               _loc127_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc127_.x = 60 - 13;
               _loc127_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc128_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc128_.x = 60 - 13 + 36;
               _loc128_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc128_.x = 60 - 13;
               _loc128_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc129_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc129_.x = 60 - 13 + 36;
               _loc129_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc129_.x = 60 - 13;
               _loc129_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc130_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc130_.x = 60 - 13 + 36;
               _loc130_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc130_.x = 60 - 13;
               _loc130_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc131_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc131_.x = 60 - 13 + 36;
               _loc131_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc131_.x = 60 - 13;
               _loc131_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc132_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc132_.x = 60 - 13 + 36;
               _loc132_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc132_.x = 60 - 13;
               _loc132_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc133_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc133_.x = 60 - 13 + 36;
               _loc133_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc133_.x = 60 - 13;
               _loc133_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc134_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc134_.x = 60 - 13 + 36;
               _loc134_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc134_.x = 60 - 13;
               _loc134_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc135_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc135_.x = 60 - 13 + 36;
               _loc135_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc135_.x = 60 - 13;
               _loc135_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc136_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc136_.x = 60 - 13 + 36;
               _loc136_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc136_.x = 60 - 13;
               _loc136_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc137_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc137_.x = 60 - 13 + 36;
               _loc137_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc137_.x = 60 - 13;
               _loc137_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc138_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc138_.x = 60 - 13 + 36;
               _loc138_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc138_.x = 60 - 13;
               _loc138_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc139_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc139_.x = 60 - 13 + 36;
               _loc139_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc139_.x = 60 - 13;
               _loc139_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc140_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc140_.x = 60 - 13 + 36;
               _loc140_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc140_.x = 60 - 13;
               _loc140_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc141_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc141_.x = 60 - 13 + 36;
               _loc141_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc141_.x = 60 - 13;
               _loc141_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc142_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc142_.x = 60 - 13 + 36;
               _loc142_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc142_.x = 60 - 13;
               _loc142_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc143_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc143_.x = 60 - 13 + 36;
               _loc143_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc143_.x = 60 - 13;
               _loc143_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc144_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc144_.x = 60 - 13 + 36;
               _loc144_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc144_.x = 60 - 13;
               _loc144_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc145_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc145_.x = 60 - 13 + 36;
               _loc145_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc145_.x = 60 - 13;
               _loc145_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc146_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc146_.x = 60 - 13 + 36;
               _loc146_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc146_.x = 60 - 13;
               _loc146_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc147_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc147_.x = 60 - 13 + 36;
               _loc147_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc147_.x = 60 - 13;
               _loc147_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc148_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc148_.x = 60 - 13 + 36;
               _loc148_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc148_.x = 60 - 13;
               _loc148_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc149_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc149_.x = 60 - 13 + 36;
               _loc149_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc149_.x = 60 - 13;
               _loc149_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc150_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc150_.x = 60 - 13 + 36;
               _loc150_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc150_.x = 60 - 13;
               _loc150_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc151_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc151_.x = 60 - 13 + 36;
               _loc151_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc151_.x = 60 - 13;
               _loc151_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc152_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc152_.x = 60 - 13 + 36;
               _loc152_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc152_.x = 60 - 13;
               _loc152_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc153_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc153_.x = 60 - 13 + 36;
               _loc153_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc153_.x = 60 - 13;
               _loc153_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc154_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc154_.x = 60 - 13 + 36;
               _loc154_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc154_.x = 60 - 13;
               _loc154_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc155_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc155_.x = 60 - 13 + 36;
               _loc155_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc155_.x = 60 - 13;
               _loc155_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc156_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc156_.x = 60 - 13 + 36;
               _loc156_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc156_.x = 60 - 13;
               _loc156_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc157_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc157_.x = 60 - 13 + 36;
               _loc157_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc157_.x = 60 - 13;
               _loc157_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc158_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc158_.x = 60 - 13 + 36;
               _loc158_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc158_.x = 60 - 13;
               _loc158_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc159_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc159_.x = 60 - 13 + 36;
               _loc159_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc159_.x = 60 - 13;
               _loc159_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc160_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc160_.x = 60 - 13 + 36;
               _loc160_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc160_.x = 60 - 13;
               _loc160_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc161_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc161_.x = 60 - 13 + 36;
               _loc161_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc161_.x = 60 - 13;
               _loc161_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc162_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc162_.x = 60 - 13 + 36;
               _loc162_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc162_.x = 60 - 13;
               _loc162_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc163_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc163_.x = 60 - 13 + 36;
               _loc163_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc163_.x = 60 - 13;
               _loc163_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc164_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc164_.x = 60 - 13 + 36;
               _loc164_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc164_.x = 60 - 13;
               _loc164_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc165_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc165_.x = 60 - 13 + 36;
               _loc165_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc165_.x = 60 - 13;
               _loc165_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc166_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc166_.x = 60 - 13 + 36;
               _loc166_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc166_.x = 60 - 13;
               _loc166_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc167_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc167_.x = 60 - 13 + 36;
               _loc167_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc167_.x = 60 - 13;
               _loc167_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc168_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc168_.x = 60 - 13 + 36;
               _loc168_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc168_.x = 60 - 13;
               _loc168_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc169_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc169_.x = 60 - 13 + 36;
               _loc169_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc169_.x = 60 - 13;
               _loc169_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc170_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc170_.x = 60 - 13 + 36;
               _loc170_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc170_.x = 60 - 13;
               _loc170_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc171_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc171_.x = 60 - 13 + 36;
               _loc171_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc171_.x = 60 - 13;
               _loc171_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc172_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc172_.x = 60 - 13 + 36;
               _loc172_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc172_.x = 60 - 13;
               _loc172_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc173_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc173_.x = 60 - 13 + 36;
               _loc173_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc173_.x = 60 - 13;
               _loc173_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc174_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc174_.x = 60 - 13 + 36;
               _loc174_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc174_.x = 60 - 13;
               _loc174_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc175_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc175_.x = 60 - 13 + 36;
               _loc175_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc175_.x = 60 - 13;
               _loc175_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc176_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc176_.x = 60 - 13 + 36;
               _loc176_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc176_.x = 60 - 13;
               _loc176_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc177_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc177_.x = 60 - 13 + 36;
               _loc177_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc177_.x = 60 - 13;
               _loc177_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc178_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc178_.x = 60 - 13 + 36;
               _loc178_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc178_.x = 60 - 13;
               _loc178_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc179_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc179_.x = 60 - 13 + 36;
               _loc179_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc179_.x = 60 - 13;
               _loc179_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc180_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc180_.x = 60 - 13 + 36;
               _loc180_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc180_.x = 60 - 13;
               _loc180_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc181_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc181_.x = 60 - 13 + 36;
               _loc181_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc181_.x = 60 - 13;
               _loc181_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc182_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc182_.x = 60 - 13 + 36;
               _loc182_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc182_.x = 60 - 13;
               _loc182_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc183_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc183_.x = 60 - 13 + 36;
               _loc183_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc183_.x = 60 - 13;
               _loc183_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc184_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc184_.x = 60 - 13 + 36;
               _loc184_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc184_.x = 60 - 13;
               _loc184_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc185_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc185_.x = 60 - 13 + 36;
               _loc185_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc185_.x = 60 - 13;
               _loc185_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc186_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc186_.x = 60 - 13 + 36;
               _loc186_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc186_.x = 60 - 13;
               _loc186_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc187_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc187_.x = 60 - 13 + 36;
               _loc187_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc187_.x = 60 - 13;
               _loc187_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc188_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc188_.x = 60 - 13 + 36;
               _loc188_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc188_.x = 60 - 13;
               _loc188_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc189_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc189_.x = 60 - 13 + 36;
               _loc189_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc189_.x = 60 - 13;
               _loc189_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc190_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc190_.x = 60 - 13 + 36;
               _loc190_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc190_.x = 60 - 13;
               _loc190_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc191_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc191_.x = 60 - 13 + 36;
               _loc191_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc191_.x = 60 - 13;
               _loc191_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc192_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc192_.x = 60 - 13 + 36;
               _loc192_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc192_.x = 60 - 13;
               _loc192_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc193_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc193_.x = 60 - 13 + 36;
               _loc193_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc193_.x = 60 - 13;
               _loc193_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc194_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc194_.x = 60 - 13 + 36;
               _loc194_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc194_.x = 60 - 13;
               _loc194_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc195_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc195_.x = 60 - 13 + 36;
               _loc195_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc195_.x = 60 - 13;
               _loc195_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc196_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc196_.x = 60 - 13 + 36;
               _loc196_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc196_.x = 60 - 13;
               _loc196_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc197_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc197_.x = 60 - 13 + 36;
               _loc197_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc197_.x = 60 - 13;
               _loc197_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc198_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc198_.x = 60 - 13 + 36;
               _loc198_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc198_.x = 60 - 13;
               _loc198_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc199_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc199_.x = 60 - 13 + 36;
               _loc199_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc199_.x = 60 - 13;
               _loc199_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc97_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc97_.x = 60 - 13 + 36;
               _loc97_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc97_.x = 60 - 13;
               _loc97_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc98_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc98_.x = 60 - 13 + 36;
               _loc98_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc98_.x = 60 - 13;
               _loc98_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc99_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc99_.x = 60 - 13 + 36;
               _loc99_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc99_.x = 60 - 13;
               _loc99_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc100_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc100_.x = 60 - 13 + 36;
               _loc100_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc100_.x = 60 - 13;
               _loc100_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc101_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc101_.x = 60 - 13 + 36;
               _loc101_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc101_.x = 60 - 13;
               _loc101_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc102_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc102_.x = 60 - 13 + 36;
               _loc102_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc102_.x = 60 - 13;
               _loc102_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc103_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc103_.x = 60 - 13 + 36;
               _loc103_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc103_.x = 60 - 13;
               _loc103_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc104_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc104_.x = 60 - 13 + 36;
               _loc104_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc104_.x = 60 - 13;
               _loc104_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc105_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc105_.x = 60 - 13 + 36;
               _loc105_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc105_.x = 60 - 13;
               _loc105_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc106_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc106_.x = 60 - 13 + 36;
               _loc106_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc106_.x = 60 - 13;
               _loc106_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc107_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc107_.x = 60 - 13 + 36;
               _loc107_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc107_.x = 60 - 13;
               _loc107_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc108_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc108_.x = 60 - 13 + 36;
               _loc108_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc108_.x = 60 - 13;
               _loc108_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc109_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc109_.x = 60 - 13 + 36;
               _loc109_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc109_.x = 60 - 13;
               _loc109_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc110_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc110_.x = 60 - 13 + 36;
               _loc110_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc110_.x = 60 - 13;
               _loc110_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc111_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc111_.x = 60 - 13 + 36;
               _loc111_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc111_.x = 60 - 13;
               _loc111_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc112_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc112_.x = 60 - 13 + 36;
               _loc112_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc112_.x = 60 - 13;
               _loc112_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc113_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc113_.x = 60 - 13 + 36;
               _loc113_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc113_.x = 60 - 13;
               _loc113_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc114_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc114_.x = 60 - 13 + 36;
               _loc114_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc114_.x = 60 - 13;
               _loc114_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc115_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc115_.x = 60 - 13 + 36;
               _loc115_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc115_.x = 60 - 13;
               _loc115_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc116_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc116_.x = 60 - 13 + 36;
               _loc116_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc116_.x = 60 - 13;
               _loc116_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc117_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc117_.x = 60 - 13 + 36;
               _loc117_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc117_.x = 60 - 13;
               _loc117_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc118_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc118_.x = 60 - 13 + 36;
               _loc118_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc118_.x = 60 - 13;
               _loc118_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc119_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc119_.x = 60 - 13 + 36;
               _loc119_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc119_.x = 60 - 13;
               _loc119_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc120_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc120_.x = 60 - 13 + 36;
               _loc120_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc120_.x = 60 - 13;
               _loc120_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
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
         this.chengHaoImg.visible = param1;
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
      
      public function setItem(param1:Array, param2:BitmapData, param3:int, param4:int, param5:int, param6:Boolean) : void
      {
         if(param3 == 0 && Boolean(this.chengHaoImg.bitmapData))
         {
            this.chengHaoImg.bitmapData.dispose();
         }
         else
         {
            this.chengHaoImg.bitmapData = StaticValue.getBitmapByClassName("ui.paihang.ph" + param3).bitmapData;
         }
         this.chengHaoImg.width = 120;
         this.chengHaoImg.height = 20.8;
         this.chonbaiCount.text = param4.toString();
         this.bishiCount.text = param5.toString();
         this.setShowItem(param1);
      }
      
      public function setCongBaiAndBiShi(param1:int, param2:int) : void
      {
         this.chonbaiCount.text = param1.toString();
         this.bishiCount.text = param2.toString();
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            this.tips.visible = true;
            if(this.chengHaoImg)
            {
               this.chengHaoImg.visible = false;
            }
            return;
         }
         this.tips.visible = false;
         if(this.chengHaoImg)
         {
            this.chengHaoImg.visible = true;
         }
         this._avatar.x = 326 - this._avatar.width / 2;
         this._avatar.y = 190 - this._avatar.height + 20;
      }
      
      public function setFlag(param1:int) : void
      {
         var onCom:Function = null;
         var value:int = param1;
         onCom = function():void
         {
            if(Boolean(flag) && Boolean(flag.parent))
            {
               flag.parent.removeChild(flag);
               flag.stop();
            }
            if(value != 0)
            {
               flag = StaticValue.getMCByClassName(StaticValue.conversionFlagID(value)) as MovieClip;
               addChildAt(flag,1);
               flag.x = 295 - flag.width / 2;
               flag.y = 10;
            }
         };
         RslLoaderManager.lazyLoad(onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
      }
      
      public function setYupei(param1:Goods) : void
      {
         if(Boolean(this.yupei) && Boolean(this.yupei.parent))
         {
            this.yupei.parent.removeChild(this.yupei);
         }
         if(!param1)
         {
            return;
         }
         this.yupei = new ItemFace(param1);
         addChildAt(this.yupei,getChildIndex(this.equipContainer) + 1);
         this.yupei.x = 346;
         this.yupei.y = 211;
      }
      
      public function setAvaterXY(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         if(param1)
         {
            this._avatar.x = 326 - this._avatar.width / 2;
            this._avatar.y = 190 - this._avatar.height - 15;
         }
         else
         {
            this._avatar.x = param2;
            this._avatar.y = param3;
         }
      }
      
      public function setZhuangbeiKaiqi() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < OtherConst.zhuangbei_dakong)
         {
            this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.equipContainer.addChildAt(this.img,0);
            if(OtherConst.zhuangbei_dakong == 3)
            {
               this.img.x = 42 + 42 * _loc1_;
            }
            else
            {
               this.img.x = 42 * _loc1_;
            }
            this.img.y = 254;
            _loc1_++;
         }
      }
   }
}

