package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.BlitFace;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.character.Player;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class GeRenChengHao extends FPanel
   {
      
      public static const UI_GERENCHENGHAO_PUTONG_CLICK:String = "UI_GERENCHENGHAO_PUTONG_CLICK";
      
      public static const UI_GERENCHENGHAO_CHENGHAO_XIANSHIYINCANG_CLICK:String = "UI_GERENCHENGHAO_CHENGHAO_XIANSHIYINCANG_CLICK";
      
      public static const UI_GERENCHENGHAO_ZHUANSHU_CLICK:String = "UI_GERENCHENGHAO_ZHUANSHU_CLICK";
      
      public static const UI_GERENCHENGHAO_QUANPINGTAI_ZHUANSHU_CLICK:String = "UI_GERENCHENGHAO_QUANPINGTAI_ZHUANSHU_CLICK";
      
      public static const UI_GERENCHENGHAO_PUTONG_GOUXUAN_CLICK:String = "UI_GERENCHENGHAO_PUTONG_GOUXUAN_CLICK";
      
      private var tabBar:FTabBar;
      
      private var bgSpr:Sprite;
      
      private var bg1:DisplayObject;
      
      private var listContainer:Sprite;
      
      private var chenghaoList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var listContainer1:Sprite;
      
      private var chenghaoList1:FList;
      
      private var Scroll1:FVScorllBar;
      
      private var avatar_zizeng:int = 0;
      
      private var _avatar:Bitmap;
      
      private var bitSpr:Sprite;
      
      private var bit:Bitmap;
      
      private var xianshiBtn:FSimpleButton;
      
      private var btnLabel:FTextArea;
      
      private var xianshiId:String = "-1";
      
      private var qingqiu:int = 0;
      
      private var shangyiyeBtn:SecondButton;
      
      private var yeshu:FTextArea;
      
      private var xiayiyeBtn:SecondButton;
      
      private var lookingId:int = 1;
      
      private var maxId:int = 1;
      
      private var mingcheng:FTextArea;
      
      private var xinxi:FTextArea;
      
      private var tf:TextFormat;
      
      public var bf:BlitFace;
      
      private var shujuArr:Array;
      
      private var biaoqianBo:Boolean = false;
      
      private var weizhi:int = 0;
      
      private var biaoqianType:int = 0;
      
      private var arr:Array;
      
      public function GeRenChengHao()
      {
         var ft:FTextArea;
         this.shujuArr = [];
         this.arr = [];
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 549 - 2 - 4 - 119;
         height = 435 - 3 + 50 + 20 - 40 - 5 - 8;
         titleText = LanResManager.getLanCommonTextWords("个人称号");
         this.addEventListener(FCloseEvent.CLOSE,this._onclose);
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("普通称号"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("专属称号"),this.onClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/gerenchenghao/putongchenghao.swf");
         this.bg1.x = 12;
         this.bg1.y = 22;
         this.bgSpr.addChild(this.bg1);
         this.bitSpr = new Sprite();
         addChild(this.bitSpr);
         this._avatar = new Bitmap();
         addChildAt(this._avatar,3);
         this.xinxi = new FTextArea();
         addChild(this.xinxi);
         this.xinxi.multiline = true;
         this.xinxi.wordWrap = true;
         this.xinxi.width = 175;
         this.xinxi.height = 70;
         this.xinxi.x = 250;
         this.xinxi.y = 300 - 6;
         this.xianshiBtn = new FSimpleButton();
         addChild(this.xianshiBtn);
         this.xianshiBtn.x = 108 + 5 + 160;
         this.xianshiBtn.y = 160 + 35 + 60 + 43;
         this.xianshiBtn.skin = "chenghaoXYButton";
         this.xianshiBtn.addEventListener(MouseEvent.CLICK,this.onXianshiClick);
         this.btnLabel = new FTextArea();
         addChild(this.btnLabel);
         this.btnLabel.multiline = true;
         this.btnLabel.wordWrap = true;
         this.btnLabel.width = 500;
         this.btnLabel.height = 16;
         this.btnLabel.x = 300 + 31 - 35;
         this.btnLabel.y = 270 - 7 + 43;
         this.btnLabel.mouseEnabled = false;
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 13;
            y = 25;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,345 + 20 + 15 + 60 + 10 + 19 - 250 - 20,125 + 267 - 65);
            graphics.endFill();
         }
         this.chenghaoList = new FList();
         this.chenghaoList.skin = "list";
         this.chenghaoList.itemRenderer = new GeRenChengHaoList();
         GeRenChengHaoList.$parent = this;
         this.chenghaoList.listWidth = 345 + 20 + 15 + 60 + 10 + 19 - 250 - 20;
         this.listContainer.addChild(this.chenghaoList);
         this.chenghaoList.x = 0;
         this.chenghaoList.y = 0;
         this.chenghaoList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,125 + 267 - 65);
         addChild(this.Scroll);
         this.Scroll.x = 380 + 20 + 60 + 10 + 17 - 250 - 20;
         this.Scroll.y = 25;
         this.listContainer1 = new Sprite();
         addChild(this.listContainer1);
         with(this.listContainer1)
         {
            x = 13;
            y = 25 + 25 - 3;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,345 + 20 + 15 + 60 + 10 + 19 - 250 - 20 + 17,125 + 267 - 65);
            graphics.endFill();
         }
         this.chenghaoList1 = new FList();
         this.chenghaoList1.skin = "list";
         this.chenghaoList1.itemRenderer = new GeRenChengHaoList();
         this.chenghaoList1.listWidth = 345 + 20 + 15 + 60 + 10 + 19 - 250 - 20 + 17;
         this.listContainer1.addChild(this.chenghaoList1);
         this.chenghaoList1.x = 0;
         this.chenghaoList1.y = 0;
         this.chenghaoList1.addEventListener(MouseEvent.CLICK,this.onListClick1);
         this.shangyiyeBtn = new SecondButton();
         this.shangyiyeBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.shangyiyeBtn);
         this.shangyiyeBtn.x = 240 + 50 - 45 - 16 - 116 + 37 - 34 - 73;
         this.shangyiyeBtn.y = 205 + 25 - 20 + 25 - 10 + 105;
         this.shangyiyeBtn.addEventListener(MouseEvent.CLICK,this.onXianshiClick);
         this.yeshu = new FTextArea();
         addChild(this.yeshu);
         this.yeshu.defaultTextFormat = this.tf;
         this.yeshu.background = true;
         this.yeshu.backgroundColor = 1186072;
         this.yeshu.width = 59;
         this.yeshu.height = 17;
         this.yeshu.x = 170 - 73;
         this.yeshu.y = 230 - 20 + 25 - 10 + 107;
         this.xiayiyeBtn = new SecondButton();
         this.xiayiyeBtn.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.xiayiyeBtn);
         this.xiayiyeBtn.x = 240 + 50 - 45 - 16 - 73;
         this.xiayiyeBtn.y = 205 + 25 - 20 + 25 - 10 + 105;
         this.xiayiyeBtn.addEventListener(MouseEvent.CLICK,this.onXianshiClick);
         this.mingcheng = new FTextArea();
         addChild(this.mingcheng);
         this.mingcheng.multiline = true;
         this.mingcheng.wordWrap = true;
         this.mingcheng.width = 500;
         this.mingcheng.height = 16;
         this.mingcheng.x = 65 - 17;
         this.mingcheng.y = 55 - 27;
         this.mingcheng.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家名称") + "           " + LanResManager.getLanCommonTextWords("称号名") + "</font>";
         ft = new FTextArea();
         addChild(ft);
         ft.multiline = true;
         ft.wordWrap = true;
         ft.width = 393;
         ft.height = 40;
         ft.x = 30 - 19 + 5;
         ft.y = 390 - 25;
         ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("专属称号玩家只能选择显示一个。普通称号类型和专属称号类型玩家可同时显示。") + "</font>";
      }
      
      private function _onclose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 325 - this._avatar.width / 2;
         this._avatar.y = 200 - this._avatar.height / 2;
      }
      
      private function setAvatar(param1:int = 2) : void
      {
         var callBack1:Function;
         var callBack0:Function;
         var callBack:Function;
         var goodsID:int = 0;
         var apdArr:Array = null;
         var apd:AvatarParamData = null;
         var play:Player = null;
         var sex:int = param1;
         goodsID = 0;
         if(sex == 1)
         {
            callBack1 = function(param1:*, param2:BitmapData):void
            {
               if(param1 != goodsID + "_" + avatar_zizeng)
               {
                  return;
               }
               avatar(param2);
            };
            goodsID = 310001;
            apdArr = [];
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.RONGYUHUANZHUANG_ID_NAN),AvatarPartType.BODY);
            apdArr.push(apd);
            this.avatar(null);
            SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack1,apdArr,0,CharStatusType.STAND);
         }
         else if(sex == 0)
         {
            callBack0 = function(param1:*, param2:BitmapData):void
            {
               if(param1 != goodsID + "_" + avatar_zizeng)
               {
                  return;
               }
               avatar(param2);
            };
            goodsID = 310002;
            apdArr = [];
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.RONGYUHUANZHUANG_ID_NV),AvatarPartType.BODY);
            apdArr.push(apd);
            this.avatar(null);
            SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack0,apdArr,0,CharStatusType.STAND);
         }
         else
         {
            callBack = function(param1:*, param2:BitmapData):void
            {
               if(param1 != GameInstance.mainChar.id + "_" + avatar_zizeng)
               {
                  return;
               }
               avatar(param2);
            };
            this.avatar(null);
            play = GameInstance.mainChar.data as Player;
            sex = play.attributeInfo.getSex();
            apdArr = play.avatarInfo.getSimpleAPDList(GameInstance.mainChar.isOnMount,sex);
            SimpleAvatarSynthesizer.synthesisSimpleAvatar(GameInstance.mainChar.id + "_" + ++this.avatar_zizeng,callBack,apdArr);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("普通称号"):
               dispatchEvent(new BaseEvent(UI_GERENCHENGHAO_PUTONG_CLICK));
               this.weizhi = 0;
               this.setAvatar();
               this.biaoqianBo = true;
               break;
            case LanResManager.getLanCommonTextWords("专属称号"):
               dispatchEvent(new BaseEvent(UI_GERENCHENGHAO_ZHUANSHU_CLICK));
               this.weizhi = 0;
               this.setAvatar();
               this.biaoqianBo = true;
               break;
            case LanResManager.getLanCommonTextWords("专属称号浏览"):
               dispatchEvent(new BaseEvent(UI_GERENCHENGHAO_QUANPINGTAI_ZHUANSHU_CLICK,"",1));
               this.weizhi = 0;
               this.biaoqianBo = true;
         }
      }
      
      private function onXianshiClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeBtn:
               dispatchEvent(new BaseEvent(UI_GERENCHENGHAO_QUANPINGTAI_ZHUANSHU_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeBtn:
               dispatchEvent(new BaseEvent(UI_GERENCHENGHAO_QUANPINGTAI_ZHUANSHU_CLICK,"",this.lookingId + 1));
               break;
            case this.xianshiBtn:
               dispatchEvent(new BaseEvent(UI_GERENCHENGHAO_CHENGHAO_XIANSHIYINCANG_CLICK,"",[this.xianshiId,this.qingqiu]));
         }
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Vector.<BitmapData> = null;
         var _loc4_:int = 0;
         var _loc5_:BitmapData = null;
         this.biaoqianBo = false;
         this.weizhi = this.chenghaoList.selectItem.weizhi;
         while(this.bitSpr.numChildren > 0)
         {
            this.bitSpr.removeChildAt(0);
         }
         if(this.chenghaoList.selectItem.id is int)
         {
            _loc2_ = this.chenghaoList.selectItem.id;
            this.bit = StaticValue.getBitmapByClassName("ui.paihang.ph" + _loc2_);
            this.bitSpr.addChild(this.bit);
            this.bit.x = 280 - 23 - 5;
            this.bit.y = 30 + 30 - 20;
         }
         else if(this.chenghaoList.selectItem.id is String)
         {
            if(this.bf != null && this.bf.parent != null)
            {
               this.bf.blit_clear();
               this.bf.parent.removeChild(this.bf);
               this.bf = null;
            }
            _loc3_ = new Vector.<BitmapData>();
            this.bf = new BlitFace();
            _loc4_ = 1;
            while(_loc4_ <= 8)
            {
               _loc5_ = LoadSwf.getBitmapData(GameConfig.fileBaseFolder + "res/ui/paihangbang/" + this.chenghaoList.selectItem.id + "/" + this.chenghaoList.selectItem.id + "_" + _loc4_ + ".swf",180,75);
               _loc3_.push(_loc5_);
               _loc4_++;
            }
            this.bf.blit_fromBitmapDataList(_loc3_,100);
            this.bitSpr.addChild(this.bf);
            this.bf.x = 280 - 23 - 20;
            this.bf.y = 30 + 30 - 40;
         }
         if(this.biaoqianType == 2)
         {
            if(this.chenghaoList.selectItem.jihuo)
            {
               this.btnLabel.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("称号隐藏") + "</font>";
               this.qingqiu = 0;
            }
            else
            {
               this.btnLabel.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("称号显示") + "</font>";
               this.qingqiu = 1;
            }
            this.xianshiId = this.chenghaoList.selectItem.id;
         }
         else
         {
            this.xianshiId = "-1";
         }
      }
      
      private function onListClick1(param1:MouseEvent) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Vector.<BitmapData> = null;
         var _loc4_:int = 0;
         var _loc5_:BitmapData = null;
         this.biaoqianBo = false;
         this.weizhi = this.chenghaoList1.selectItem.weizhi;
         while(this.bitSpr.numChildren > 0)
         {
            this.bitSpr.removeChildAt(0);
         }
         if(this.chenghaoList1.selectItem.id is int)
         {
            _loc2_ = this.chenghaoList1.selectItem.id;
            this.bit = StaticValue.getBitmapByClassName("ui.paihang.ph" + _loc2_);
            this.bitSpr.addChild(this.bit);
            this.bit.x = 280 - 23 - 5;
            this.bit.y = 30 + 30 - 20;
         }
         else if(this.chenghaoList1.selectItem.id is String)
         {
            if(this.bf != null && this.bf.parent != null)
            {
               this.bf.blit_clear();
               this.bf.parent.removeChild(this.bf);
               this.bf = null;
            }
            _loc3_ = new Vector.<BitmapData>();
            this.bf = new BlitFace();
            _loc4_ = 1;
            while(_loc4_ <= 8)
            {
               _loc5_ = LoadSwf.getBitmapData(GameConfig.fileBaseFolder + "res/ui/paihangbang/" + this.chenghaoList1.selectItem.id + "/" + this.chenghaoList1.selectItem.id + "_" + _loc4_ + ".swf",180,75);
               _loc3_.push(_loc5_);
               _loc4_++;
            }
            this.bf.blit_fromBitmapDataList(_loc3_,100);
            this.bitSpr.addChild(this.bf);
            this.bf.x = 280 - 23 - 20;
            this.bf.y = 30 + 30 - 40;
         }
         this.xinxi.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色名称：") + this.chenghaoList1.selectItem.name + "<br>" + LanResManager.getLanCommonTextWords("拥有专属称号数量：") + this.chenghaoList1.selectItem.count + "<br>" + LanResManager.getLanCommonTextWords("显示角色所在平台：") + OtherConst.getPingTaiById(this.chenghaoList1.selectItem.pingtai) + "<br></font>";
      }
      
      public function setBiaoqian() : void
      {
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("普通称号"));
      }
      
      public function setInitialize(param1:Array, param2:int = 3, param3:int = 1, param4:int = 1) : void
      {
         this.shujuArr = param1;
         this.yeshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param3 + "/" + param4 + "</font>";
         this.lookingId = param3;
         if(param3 <= 1)
         {
            this.shangyiyeBtn.enabled = false;
         }
         else
         {
            this.shangyiyeBtn.enabled = true;
         }
         if(param3 >= param4)
         {
            this.xiayiyeBtn.enabled = false;
         }
         else
         {
            this.xiayiyeBtn.enabled = true;
         }
         while(this.bgSpr.numChildren > 0)
         {
            this.bgSpr.removeChildAt(0);
         }
         if(param2 == 2)
         {
            this.biaoqianType = 2;
            this.xianshiBtn.visible = true;
            this.btnLabel.visible = true;
            this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/gerenchenghao/putongchenghao.swf");
            this.bg1.x = 12;
            this.bg1.y = 22;
            this.bgSpr.addChild(this.bg1);
            this.shangyiyeBtn.visible = false;
            this.xiayiyeBtn.visible = false;
            this.yeshu.visible = false;
            this.xianshiId = param1[0].id;
         }
         else if(param2 == 3)
         {
            this.xianshiBtn.visible = false;
            this.btnLabel.visible = false;
            this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/gerenchenghao/pingtaichenghao.swf");
            this.bg1.x = 12;
            this.bg1.y = 22;
            this.bgSpr.addChild(this.bg1);
            this.shangyiyeBtn.visible = true;
            this.xiayiyeBtn.visible = true;
            this.yeshu.visible = true;
         }
         else
         {
            this.biaoqianType = 1;
            this.xianshiId = "-1";
            this.xianshiBtn.visible = true;
            this.btnLabel.visible = true;
            this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/gerenchenghao/putongchenghao.swf");
            this.bg1.x = 12;
            this.bg1.y = 22;
            this.bgSpr.addChild(this.bg1);
            this.shangyiyeBtn.visible = false;
            this.xiayiyeBtn.visible = false;
            this.yeshu.visible = false;
         }
         if(param2 == 3)
         {
            this.listContainer.visible = false;
            this.listContainer1.visible = true;
            this.chenghaoList1.dataProvider = param1;
            this.mingcheng.visible = true;
            this.Scroll.visible = false;
            this.xinxi.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色名称：") + param1[0].name + "<br>" + LanResManager.getLanCommonTextWords("拥有专属称号数量：") + param1[0].count + "<br>" + LanResManager.getLanCommonTextWords("显示角色所在平台：") + OtherConst.getPingTaiById(param1[0].pingtai) + "<br></font>";
            this.xinxi.visible = true;
         }
         else
         {
            this.listContainer.visible = true;
            this.listContainer1.visible = false;
            this.chenghaoList.dataProvider = param1;
            this.mingcheng.visible = false;
            this.xinxi.visible = false;
            this.Scroll.update();
         }
         if(param1.length != 0)
         {
            this.chenghaoList.setSelectItemByIndex(this.weizhi);
         }
         if(param2 == 1)
         {
            this.btnLabel.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("称号隐藏") + "</font>";
            this.qingqiu = 0;
         }
         else if(param2 == 0)
         {
            this.btnLabel.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("称号显示") + "</font>";
            this.qingqiu = 1;
         }
         else if(param1[this.weizhi].jihuo)
         {
            this.btnLabel.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("称号隐藏") + "</font>";
            this.qingqiu = 0;
         }
         else
         {
            this.btnLabel.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("称号显示") + "</font>";
            this.qingqiu = 1;
         }
         if(this.biaoqianBo)
         {
            this.morenChenghao();
         }
      }
      
      private function morenChenghao() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Vector.<BitmapData> = null;
         var _loc3_:int = 0;
         var _loc4_:BitmapData = null;
         while(this.bitSpr.numChildren > 0)
         {
            this.bitSpr.removeChildAt(0);
         }
         if(this.shujuArr[0].id is int)
         {
            _loc1_ = this.shujuArr[0].id;
            this.bit = StaticValue.getBitmapByClassName("ui.paihang.ph" + _loc1_);
            this.bitSpr.addChild(this.bit);
            this.bit.x = 280 - 23 - 5;
            this.bit.y = 30 + 30 - 20;
         }
         else if(this.shujuArr[0].id is String)
         {
            if(this.bf != null && this.bf.parent != null)
            {
               this.bf.blit_clear();
               this.bf.parent.removeChild(this.bf);
               this.bf = null;
            }
            _loc2_ = new Vector.<BitmapData>();
            this.bf = new BlitFace();
            _loc3_ = 1;
            while(_loc3_ <= 8)
            {
               _loc4_ = LoadSwf.getBitmapData(GameConfig.fileBaseFolder + "res/ui/paihangbang/" + this.shujuArr[0].id + "/" + this.shujuArr[0].id + "_" + _loc3_ + ".swf",180,75);
               _loc2_.push(_loc4_);
               _loc3_++;
            }
            this.bf.blit_fromBitmapDataList(_loc2_,100);
            this.bitSpr.addChild(this.bf);
            this.bf.x = 280 - 23 - 20;
            this.bf.y = 30 + 30 - 40;
         }
      }
   }
}

