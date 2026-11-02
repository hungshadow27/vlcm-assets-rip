package com.tgame.shell.view.components.jingjichang
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
   import com.tgame.shell.view.components.attribute.EquipList;
   import com.tgame.shell.view.components.conquerPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class JingjiChangPanel extends Sprite
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
      
      private var lingquBtn:SmallButton;
      
      private var guizheChaxunBtn:SecondButton;
      
      private var startJingjiBtn:SecondButton;
      
      private var baoguoBtn:SecondButton;
      
      private var shengwangBtn:SecondButton;
      
      private var paimingDes2:FTextArea;
      
      private var img:Bitmap;
      
      public var equipList:EquipList;
      
      private var yupei:ItemFace;
      
      public function JingjiChangPanel()
      {
         super();
         this.initPanel();
      }
      
      private function initPanel() : void
      {
         var lb:FLabel;
         var paimingDes:FTextArea;
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
         this.bgImg.name = "ui.jingjichang.ui";
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.chengHaoImg = new Bitmap(new BitmapData(120,20.8,true,0));
         this.chengHaoImg.width = 120;
         this.chengHaoImg.height = 20.8;
         this.chengHaoImg.x = 20 + 35;
         this.chengHaoImg.y = 4 + 6;
         addChild(this.chengHaoImg);
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 225 - 214 + 0.5;
         this.equipContainer.y = 6 + 8 + 0.5;
         lb = new FLabel();
         with(lb)
         {
            x = 250;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanCommonTextWords("排名");
         addChild(lb);
         this.title2 = new FTextArea();
         this.title2.mouseEnabled = false;
         with(this.title2)
         {
            x = 326;
            y = 6;
            width = 80;
            height = 18;
            defaultTextFormat = new TextFormat(null,null,StaticValue.WHITE,null,null,null,null,null,"center");
            filters = StaticValue.filter;
         }
         this.title2.text = LanResManager.getLanCommonTextWords("姓名");
         addChild(this.title2);
         this.title3 = new FTextArea();
         with(this.title3)
         {
            x = 466;
            y = 6;
            autoSize = TextFieldAutoSize.LEFT;
            defaultTextFormat = new TextFormat(null,null,StaticValue.WHITE,null,null,null,null,null,"center");
            filters = StaticValue.filter;
         }
         this.title3.text = LanResManager.getLanCommonTextWords("本周曾获论剑声望");
         addChild(this.title3);
         this.rankingList = new FList();
         this.rankingList.skin = "list";
         this.rankingList.listWidth = 352;
         this.rankingList.listHeight = 219;
         this.rankingList.itemRenderer = new JingjiListRander();
         this.rankingList.x = 230;
         this.rankingList.y = 28;
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
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 328;
         this.homePageBtn.y = 241;
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
            x = preBtn.x + 22;
            y = homePageBtn.y;
            textColor = StaticValue.WHITE;
            text = "1/1";
         }
         addChild(this.pageCount);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = this.pageCount.x + 37;
         this.nextBtn.y = this.homePageBtn.y;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanCommonTextWords("尾页");
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
            x = 278 - 210;
            y = 100 - 45;
            width = 96;
            height = 40;
            defaultTextFormat = new TextFormat(null,null,StaticValue.YELLOW,null,null,null,null,null,"center");
            filters = StaticValue.filter;
            visible = false;
         }
         this.tips.text = LanResManager.getLanCommonTextWords("玩家不在线");
         addChild(this.tips);
         lb = new FLabel();
         with(lb)
         {
            x = 19;
            y = 275;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("被崇拜次数:　　　被鄙视次数:");
         }
         this.chonbaiCount = new FLabel();
         with(this.chonbaiCount)
         {
            x = 95;
            y = lb.y;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "9999";
         }
         this.bishiCount = new FLabel();
         with(this.bishiCount)
         {
            x = 177;
            y = lb.y;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "9999";
         }
         this.chongbaiBtn = new SecondButton();
         this.chongbaiBtn.label = LanResManager.getLanCommonTextWords("崇拜一下");
         this.chongbaiBtn.x = 23;
         this.chongbaiBtn.y = 311;
         this.chongbaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.bishiBtn = new SecondButton();
         this.bishiBtn.label = LanResManager.getLanCommonTextWords("鄙视一下");
         this.bishiBtn.x = this.chongbaiBtn.x + 103;
         this.bishiBtn.y = this.chongbaiBtn.y;
         this.bishiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ico = new CharAttributeOccultIco();
         addChild(this.ico);
         this.ico.x = 104 + 41;
         this.ico.y = 15 + 7;
         this.ico.visible = false;
         this.lingquBtn = new SmallButton();
         this.lingquBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
         addChild(this.lingquBtn);
         this.lingquBtn.x = 543;
         this.lingquBtn.y = 318;
         this.lingquBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.guizheChaxunBtn = new SecondButton();
         this.guizheChaxunBtn.label = LanResManager.getLanCommonTextWords("跨服竞技规则查询");
         this.guizheChaxunBtn.x = 10;
         this.guizheChaxunBtn.y = 353;
         this.guizheChaxunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.startJingjiBtn = new SecondButton();
         this.startJingjiBtn.label = LanResManager.getLanCommonTextWords("开始竞技");
         addChild(this.startJingjiBtn);
         this.startJingjiBtn.x = 253;
         this.startJingjiBtn.y = 353;
         this.startJingjiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.baoguoBtn = new SecondButton();
         this.baoguoBtn.label = LanResManager.getLanCommonTextWords("跨服包裹与收益取回");
         addChild(this.baoguoBtn);
         this.baoguoBtn.x = 325;
         this.baoguoBtn.y = 353;
         this.baoguoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shengwangBtn = new SecondButton();
         this.shengwangBtn.label = LanResManager.getLanCommonTextWords("声望商店购物");
         addChild(this.shengwangBtn);
         this.shengwangBtn.x = 467;
         this.shengwangBtn.y = 353;
         this.shengwangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         paimingDes = new FTextArea();
         with(paimingDes)
         {
            x = 227;
            y = 269;
            width = 365;
            height = 40;
            textColor = StaticValue.GREEN;
            defaultTextFormat = new TextFormat(null,null,StaticValue.WHITE,null,null,null,null,null,"left");
            filters = StaticValue.filter;
         }
         paimingDes.htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanTextWords(this,"论剑声望可用于声望商城购物，每周一7:00清空，请勿囤积");
         addChild(paimingDes);
         this.paimingDes2 = new FTextArea();
         with(this.paimingDes2)
         {
            x = 227;
            y = 305;
            width = 315;
            height = 40;
            defaultTextFormat = new TextFormat(null,null,StaticValue.WHITE,null,null,null,null,null,"left");
            filters = StaticValue.filter;
         }
         addChild(this.paimingDes2);
         addChild(this.rankingList);
         this.equipList = new EquipList();
         this.equipList.x = 20;
         this.equipList.y = 320 - 50;
         this.equipList.$parent = this;
         this.equipList.$parent2 = this.$parent;
         this.equipList.setClickSta(false,true);
         addChild(this.equipList);
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(!this.rankingList.selectItem)
         {
            return;
         }
         this.clear();
         this.ico.setState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         this.ico.setSiShengShouState(0,0,0,0);
         this.ico.setXiantian(false,0,0,-1);
         this.ico.setHuXinYao(false);
         this.ico.setRouti(false);
         this.ico.setWuhun(0,false,false,0,false,0,false,false,0);
         this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_PARTICULAR_INFO_SHOW,"",{
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
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_LIST_GET_PAGE,"",1));
               break;
            case this.preBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_LIST_GET_PAGE,"",2));
               break;
            case this.nextBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_LIST_GET_PAGE,"",3));
               break;
            case this.endPageBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_LIST_GET_PAGE,"",4));
               break;
            case this.chongbaiBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_LIST_MUTUAL,"",1));
               break;
            case this.bishiBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_LIST_MUTUAL,"",2));
               break;
            case this.lingquBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_lINGQUJIAGNLI_BTN_CLICK,"",2));
               break;
            case this.guizheChaxunBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_JINGJIGUIZECHAXUN_BTN_CLICK,"",2));
               break;
            case this.startJingjiBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_KAISHIJINGJI_BTN_CLICK,"",2));
               break;
            case this.baoguoBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_BAOGUOSHOUYIQUHUI_BTN_CLICK,"",2));
               break;
            case this.shengwangBtn:
               this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK,"",2));
         }
      }
      
      public function setShowItem(param1:Array, param2:* = 0) : void
      {
         var _loc3_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:ItemFace = null;
         var _loc7_:Boolean = false;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.equipList.initEquipList();
         var _loc4_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1[_loc3_] as Goods;
            if(!(_loc5_.res.position == ItemPositionRange.POSTION_BOW || _loc5_.res.position == ItemPositionRange.POSTION_ZHENHUN))
            {
               _loc6_ = new ItemFace(_loc5_);
               _loc7_ = true;
               switch(_loc5_.res.position)
               {
                  case ItemPositionRange.POSTION_WUQI:
                     _loc6_.x = 0;
                     _loc6_.y = 0;
                     break;
                  case ItemPositionRange.POSTION_QIBING:
                     _loc6_.x = 0;
                     _loc6_.y = 41;
                     break;
                  case ItemPositionRange.POSTION_YIFU:
                     _loc6_.x = 0;
                     _loc6_.y = 82;
                     break;
                  case ItemPositionRange.POSTION_HUSHOU:
                     _loc6_.x = 0;
                     _loc6_.y = 123;
                     break;
                  case ItemPositionRange.POSTION_HUYAO:
                     _loc6_.x = 0;
                     _loc6_.y = 164;
                     break;
                  case ItemPositionRange.POSTION_HUXUE:
                     _loc6_.x = 0;
                     _loc6_.y = 205;
                     break;
                  case ItemPositionRange.POSTION_TOUSHI:
                     _loc6_.x = 168;
                     _loc6_.y = 0;
                     break;
                  case ItemPositionRange.POSTION_XIANGLIAN:
                     _loc6_.x = 168;
                     _loc6_.y = 41;
                     break;
                  case ItemPositionRange.POSTION_JIEZHI:
                     _loc6_.x = 168;
                     _loc6_.y = 82;
                     break;
                  case ItemPositionRange.POSTION_SHOUZHUO:
                     _loc6_.x = 168;
                     _loc6_.y = 123;
                     break;
                  case ItemPositionRange.POSTION_YAOZHUI:
                     _loc6_.x = 168;
                     _loc6_.y = 164;
                     break;
                  case ItemPositionRange.POSTION_PIFENG:
                     _loc6_.x = 168;
                     _loc6_.y = 205;
                     break;
                  case ItemPositionRange.POSTION_WULINGONGDIXUNZHANG:
                     _loc6_.x = 121;
                     _loc6_.y = 168;
                     break;
                  case ItemPositionRange.POSTION_TESHU:
                     _loc6_.x = 84;
                     _loc6_.y = 205;
                     break;
                  case ItemPositionRange.POSTION_HUIZHANG:
                  case ItemPositionRange.POSTION_JINIANXUNZHANG:
                  case ItemPositionRange.POSTION_KUAPINGTAI_BIWU_XUNZHANG:
                  case ItemPositionRange.POSTION_ZHUANGBEIWEIZHI1:
                  case ItemPositionRange.POSTION_ZHUANGBEIWEIZHI2:
                  case ItemPositionRange.POSTION_FUZHIPIN:
                  case ItemPositionRange.POSTION_ZHANJIA:
                  case ItemPositionRange.POSTION_CIQING:
                  case ItemPositionRange.POSTION_DWJSHUIZHANG:
                  case ItemPositionRange.POSTION_PEIJIAN:
                  case ItemPositionRange.POSTION_BOSS_HUIZHANG:
                  case ItemPositionRange.POSTION_HUIZHANG2:
                  case ItemPositionRange.POSTION_HUIZHANG3:
                  case ItemPositionRange.POSTION_HUIZHANG4:
                  case ItemPositionRange.POSTION_HUIZHANG5:
                  case ItemPositionRange.POSTION_HUIZHANG6:
                  case ItemPositionRange.POSTION_HUIZHANG7:
                  case ItemPositionRange.POSTION_HUIZHANG8:
                  case ItemPositionRange.POSTION_HUIZHANG9:
                  case ItemPositionRange.POSTION_HUIZHANG10:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI1:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI2:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI3:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI4:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI5:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI6:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI7:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI8:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI9:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI10:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI11:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI12:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI13:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI14:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI15:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI16:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI17:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI18:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI19:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI20:
                     this.equipList.addEuqip(_loc5_);
                     _loc7_ = false;
                     break;
                  default:
                     _loc7_ = false;
               }
               if(_loc5_.res.position >= ItemPositionRange.POSTION_XUNZHANG_2018_ARR.x && _loc5_.res.position <= ItemPositionRange.POSTION_XUNZHANG_2018_ARR.y || _loc5_.res.position >= ItemPositionRange.POSTION_HUODONG_ARR.x && _loc5_.res.position <= ItemPositionRange.POSTION_HUODONG_ARR.y || _loc5_.res.position >= ItemPositionRange.POSTION_HUODONG_ARR1.x && _loc5_.res.position <= ItemPositionRange.POSTION_HUODONG_ARR1.y)
               {
                  this.equipList.addEuqip(_loc5_);
                  _loc7_ = false;
               }
               if(_loc5_.id == param2)
               {
                  _loc6_.x = 84 - 37;
                  _loc6_.y = 205;
                  _loc7_ = true;
               }
               if(_loc7_)
               {
                  _loc6_.showRedMask();
                  _loc6_.showStrengthenLv = true;
                  _loc6_.name = String(_loc5_.res.position);
                  this.equipContainer.addChild(_loc6_);
               }
            }
            _loc3_++;
         }
         this.equipList.setEquipItem();
      }
      
      private function resizeXuanyuanjianYlzr() : void
      {
         var _loc24_:DisplayObject = null;
         var _loc1_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_SHENQI));
         var _loc2_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_YLZR));
         var _loc3_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_STDRJ));
         var _loc4_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_AOJIAN));
         var _loc5_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_GJMY));
         var _loc6_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_LONGYA));
         var _loc7_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_POJUN));
         var _loc8_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_DAGOUBANG));
         var _loc9_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_XUANTIEZHONGJIAN));
         var _loc10_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_XINGTIAN_GUOFU));
         var _loc11_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_GUXING_GUOFU));
         var _loc12_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_JINWUMINGGUANGTANG_GUOFU));
         var _loc13_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_LIETIANBAWANGJI_GUOFU));
         var _loc14_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZILINGHUANYUEJI_GUOFU));
         var _loc15_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUYINGJIAN_GUOFU));
         var _loc16_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHENGXIAOSHENQI));
         var _loc17_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOYUN_GUOFU));
         var _loc18_:int = 36;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:Array = [];
         var _loc22_:int = 0;
         while(_loc22_ < ItemPositionRange.POSITION_NB_WEAPON_ARR.length)
         {
            _loc24_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_NB_WEAPON_ARR[_loc22_]));
            if(_loc24_)
            {
               _loc21_.push(_loc24_);
            }
            _loc22_++;
         }
         var _loc23_:int = 0;
         while(_loc23_ < _loc21_.length)
         {
            if(_loc21_[_loc23_])
            {
               if(_loc19_ > 5)
               {
                  _loc21_[_loc23_].x = 272 - 226 + 36;
                  _loc21_[_loc23_].y = 211 - 6 - _loc18_ * _loc20_ - 36;
                  _loc20_++;
               }
               else
               {
                  _loc21_[_loc23_].x = 272 - 226;
                  _loc21_[_loc23_].y = 211 - 6 - _loc18_ * _loc19_;
                  _loc19_++;
               }
            }
            _loc23_++;
         }
         if(_loc1_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc1_.x = 272 - 226 + 36;
               _loc1_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc1_.x = 272 - 226;
               _loc1_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc2_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc2_.x = 272 - 226 + 36;
               _loc2_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc2_.x = 272 - 226;
               _loc2_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc3_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc3_.x = 272 - 226 + 36;
               _loc3_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc3_.x = 272 - 226;
               _loc3_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc4_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc4_.x = 272 - 226 + 36;
               _loc4_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc4_.x = 272 - 226;
               _loc4_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc5_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc5_.x = 272 - 226 + 36;
               _loc5_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc5_.x = 272 - 226;
               _loc5_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc6_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc6_.x = 272 - 226 + 36;
               _loc6_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc6_.x = 272 - 226;
               _loc6_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc7_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc7_.x = 272 - 226 + 36;
               _loc7_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc7_.x = 272 - 226;
               _loc7_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc8_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc8_.x = 272 - 226 + 36;
               _loc8_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc8_.x = 272 - 226;
               _loc8_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc9_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc9_.x = 272 - 226 + 36;
               _loc9_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc9_.x = 272 - 226;
               _loc9_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc10_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc10_.x = 272 - 226 + 36;
               _loc10_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc10_.x = 272 - 226;
               _loc10_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc11_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc11_.x = 272 - 226 + 36;
               _loc11_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc11_.x = 272 - 226;
               _loc11_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc12_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc12_.x = 272 - 226 + 36;
               _loc12_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc12_.x = 272 - 226;
               _loc12_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc13_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc13_.x = 272 - 226 + 36;
               _loc13_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc13_.x = 272 - 226;
               _loc13_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc14_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc14_.x = 272 - 226 + 36;
               _loc14_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc14_.x = 272 - 226;
               _loc14_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc15_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc15_.x = 272 - 226 + 36;
               _loc15_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc15_.x = 272 - 226;
               _loc15_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc16_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc16_.x = 272 - 226 + 36;
               _loc16_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc16_.x = 272 - 226;
               _loc16_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc17_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc17_.x = 272 - 226 + 36;
               _loc17_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc17_.x = 272 - 226;
               _loc17_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
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
            this.$parent.dispatchEvent(new BaseEvent(conquerPanel.UI_JINGJIPANEL_PARTICULAR_INFO_SHOW,"",{
               "playerID":int(this.rankingList.selectItem.label),
               "mountID":int(this.rankingList.selectItem.mountID),
               "NO":int(this.rankingList.selectItem.NO)
            }));
         }
         this.pageCount.text = param3 + "/" + param4;
      }
      
      public function setItem(param1:Array, param2:BitmapData, param3:int, param4:int, param5:int, param6:Boolean, param7:* = 0) : void
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
         this.setShowItem(param1,param7);
      }
      
      public function setCongBaiAndBiShi(param1:int, param2:int) : void
      {
         this.chonbaiCount.text = param1.toString();
         this.bishiCount.text = param2.toString();
      }
      
      public function setAavatar(param1:BitmapData) : void
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
         this._avatar.x = 326 - this._avatar.width / 2 - 210;
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
               this.equipContainer.addChildAt(flag,1);
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
         this.yupei.x = 146 - 12;
         this.yupei.y = 239 - 20;
      }
      
      public function clear() : void
      {
         this.setTitle(false);
         this.setCongBaiAndBiShi(0,0);
         this.setAavatar(null);
         this.setFlag(0);
         this.setYupei(null);
      }
      
      public function setJianJiICOState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this.ico.setState(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function setSiShengShouState(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.ico.setSiShengShouState(param1,param2,param3,param4);
      }
      
      public function setJianJiShangbang(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:String = null;
         if(param1 == 1)
         {
            _loc4_ = LanResManager.getLanCommonTextWords("【已上榜】");
         }
         else
         {
            _loc4_ = LanResManager.getLanCommonTextWords("【未上榜】");
         }
         this.paimingDes2.htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanTextWords(this,"上榜的前十玩家可每日领取颗紫色榛子作为奖励",[StaticValue.GREEN_HTML,StaticValue.PURPLE50_HTML,_loc4_,StaticValue.PURPLE50_HTML,param2]);
         if(param3)
         {
            this.lingquBtn.enabled = true;
         }
         else
         {
            this.lingquBtn.enabled = true;
         }
      }
      
      public function setStatisticsData(param1:Array, param2:Array) : void
      {
      }
      
      public function setAvaterXY(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         if(param1)
         {
            this._avatar.x = 326 - this._avatar.width / 2 - 210;
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
         while(_loc1_ < OtherConst.zhuangbei_dakong)
         {
            this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            addChild(this.img);
            if(OtherConst.zhuangbei_dakong == 3)
            {
               this.img.x = 12 + 42 + 42 * _loc1_;
            }
            else
            {
               this.img.x = 12 + 42 * _loc1_;
            }
            this.img.y = 254 + 14;
            _loc1_++;
         }
      }
   }
}

