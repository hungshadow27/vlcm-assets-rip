package com.tgame.shell.view.components.attribute.tushidahui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.tushidahui.view.info.TushidahuiChuangGuanVO;
   import com.tgame.moudels.tushidahui.view.info.TushidahuiVO;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class Tushidahui extends Sprite
   {
      
      public static const UI_TUSHIDAHUI_GUANBI_CLICK:String = "UI_TUSHIDAHUI_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var tf:TextFormat;
      
      private var _propertyCanvas:TushidahuiPropertyCanvas;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var _chuangGuanBtn:SmallButton;
      
      private var _upgradeBtn:SmallButton;
      
      private var _chuangGuanCanvas:TushidahuiTupoCanvas;
      
      public var $parent:DisplayObject;
      
      private var _bg:DisplayObject;
      
      private var _vo:TushidahuiVO;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var LV_MAX:int = 8;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public var buzhenSpr:Sprite;
      
      private var item:ItemFace;
      
      private var bg9:F9GridBitmap;
      
      private var jinengSpr:Sprite;
      
      private var tishi:FTextArea;
      
      private var _desTxt:FTextArea;
      
      private var _goodsNameTxt:TextField;
      
      private var _goodsUseTxt:TextField;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts2Int:int = 0;
      
      private var fts3:FTextArea;
      
      public function Tushidahui()
      {
         var $mask:Sprite;
         var box:FCanvas = null;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tf = new TextFormat();
         this.tf.align = "center";
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 200;
         box.width = 403;
         box.height = 65;
         this._propertyCanvas = new TushidahuiPropertyCanvas();
         addChild(this._propertyCanvas);
         this._propertyCanvas.x = 10;
         this._propertyCanvas.y = 270;
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.buzhenSpr = new Sprite();
         with(this.buzhenSpr)
         {
            x = 30 + 2;
            y = 10 + 2;
         }
         addChild(this.buzhenSpr);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 90;
         this.previousButton.y = 155 + 25;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 185;
         this.cengshu.height = 17;
         this.cengshu.x = 112;
         this.cengshu.y = 155 + 25;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("第一层") + "</font>";
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 295;
         this.nextButton.y = 155 + 25;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this._chuangGuanBtn = new SmallButton();
         this._chuangGuanBtn.label = LanResManager.getLanCommonTextWords("开始闯关");
         addChild(this._chuangGuanBtn);
         this._chuangGuanBtn.x = 315;
         this._chuangGuanBtn.y = 240;
         this._chuangGuanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this._upgradeBtn = new SmallButton();
         this._upgradeBtn.label = LanResManager.getLanCommonTextWords("提升属性");
         addChild(this._upgradeBtn);
         this._upgradeBtn.x = 340;
         this._upgradeBtn.y = 342;
         this._upgradeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 160 + 2;
         this.jinengSpr.y = 266 - 2 - 1 - 10 + 2;
         addChild(this.jinengSpr);
         this._desTxt = new FTextArea();
         addChild(this._desTxt);
         this._desTxt.multiline = true;
         this._desTxt.filters = StaticValue.filter;
         this._desTxt.textColor = StaticValue.GREEN;
         this._desTxt.autoSize = TextFieldAutoSize.CENTER;
         this._desTxt.wordWrap = true;
         this._desTxt.width = 390;
         this._desTxt.x = 6;
         this._desTxt.y = 208;
         this._chuangGuanCanvas = new TushidahuiTupoCanvas();
         addChild(this._chuangGuanCanvas);
         this._chuangGuanCanvas.x = 138;
         this._chuangGuanCanvas.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,500,390);
            endFill();
         }
         this._chuangGuanCanvas.mask = $mask;
         this._goodsNameTxt = new TextField();
         addChild(this._goodsNameTxt);
         this._goodsNameTxt.x = 330;
         this._goodsNameTxt.y = 267;
         this._goodsUseTxt = new TextField();
         addChild(this._goodsUseTxt);
         this._goodsUseTxt.x = 340;
         this._goodsUseTxt.y = 322;
         this._goodsUseTxt.autoSize = TextFieldAutoSize.LEFT;
         this._goodsNameTxt.filters = this._goodsUseTxt.filters = StaticValue.filter;
         this._goodsNameTxt.textColor = StaticValue.ORANGE;
         this._goodsUseTxt.textColor = StaticValue.BlUE20;
         this._goodsNameTxt.mouseEnabled = this._goodsUseTxt.mouseEnabled = false;
         this._goodsNameTxt.width = 70;
         this._goodsNameTxt.autoSize = TextFieldAutoSize.CENTER;
         addEventListener(UI_TUSHIDAHUI_GUANBI_CLICK,this.aa1);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 13;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("屠狮大会最终激活秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击888888888 防御688888888 暴击2888 闪避2888 血量1288888888、所有武功提升888层") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 13 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 160;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("屠狮大会闯关密令（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("隐藏属性：每次可使用屠狮闯关令×1进行加成，每次增加30亿攻击，武功3000层，上限500次。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + fts2Int + LanResManager.getLanCommonTextWords("块屠狮闯关令");
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 13 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 160;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("屠狮战神心法秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击1688888888900 防御1288888888900 血量2088888888900暴击 88888闪避8888  所有武功250000层") + "<br>" + LanResManager.getLanCommonTextWords("屠狮战神心法：死亡瞬间必定触发，对周围5格范围内玩家造成50%当前血量伤害，并100%造成对手体力内力全失，") + "<br>" + LanResManager.getLanCommonTextWords("定身3秒。");
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onTextTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.tishi.addEventListener(MouseEvent.MOUSE_MOVE,this.onTextTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("属性组成：勋章属性之和 * 阵位系数（当前阵法最大翻倍数）") + "</font></textformat>";
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.tishi.removeEventListener(MouseEvent.MOUSE_MOVE,this.onTextTip);
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showTupoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(TushidahuiConst.UI_TUSHIDAHUI_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(TushidahuiConst.UI_TUSHIDAHUI_XIAYIYE_CLICK));
               break;
            case this._chuangGuanBtn:
               this.$parent.dispatchEvent(new BaseEvent(TushidahuiConst.UI_TUSHIDAHUI_LINGWU_SHOW));
               break;
            case this._upgradeBtn:
               this.$parent.dispatchEvent(new BaseEvent(TushidahuiConst.UI_TUSHIDAHUI_UPGRADE_CLICK));
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this._chuangGuanCanvas._parent2 = param1;
         this._chuangGuanCanvas._parent3 = this;
      }
      
      public function setInitialize(param1:Boolean, param2:TushidahuiVO) : void
      {
         this.setJiHuo(param1);
         this._vo = param2;
         this.reloadImg();
         this._desTxt.text = param2.des;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2.name + "</font>";
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2.goodsID,true);
         this.setGoods(_loc3_,_loc3_.count > param2.goodsCnt);
         this._propertyCanvas.setVo(param1,param2);
         if(this.tupoBo)
         {
            this.previousButton.enabled = false;
            this._chuangGuanBtn.enabled = false;
            this._upgradeBtn.enabled = false;
            this.nextButton.enabled = false;
         }
         else
         {
            if(param2.allowChuangGuan)
            {
               this._upgradeBtn.enabled = false;
               if(param2.lookLv < param2.nowLv)
               {
                  this._chuangGuanBtn.enabled = false;
               }
               else if(param2.lookLv == param2.nowLv)
               {
                  this._chuangGuanBtn.enabled = true;
               }
               else if(param2.lookLv > param2.nowLv)
               {
                  this._chuangGuanBtn.enabled = false;
               }
               if(param2.lookLv >= this.LV_MAX)
               {
                  this._chuangGuanBtn.enabled = false;
               }
            }
            else
            {
               this._chuangGuanBtn.enabled = false;
               if(param2.lookLv == param2.nowLv)
               {
                  this._upgradeBtn.enabled = true;
               }
               else
               {
                  this._upgradeBtn.enabled = false;
               }
            }
            if(param2.lookLv <= 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(param2.lookLv >= this.LV_MAX)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
         }
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.TUSHIDAHUI_ZUIZHONGJIHUO_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.TUSHIDAHUI_CHUANGGUANMILING_ID];
            this.fts2Int = GameState.dictMainStatus[SpecialGoodsID.TUSHIDAHUI_LINGPAI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.TUSHIDAHUI_ZHANSHENXINFA_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.TUSHIDAHUI_ZUIZHONGJIHUO_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.TUSHIDAHUI_CHUANGGUANMILING_ID];
            this.fts2Int = GameState.dictTargetStatus[SpecialGoodsID.TUSHIDAHUI_LINGPAI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.TUSHIDAHUI_ZHANSHENXINFA_ID];
         }
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 351;
         this.item.y = 287;
         addChild(this.item);
         this._goodsNameTxt.text = param1.res.name;
         if(!param2)
         {
            this.item.filters = Tools.blackWhiteFilter;
            this._goodsUseTxt.htmlText = LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + this._vo.goodsCnt + "</font><br>";
         }
         else
         {
            this.item.filters = [];
            this._goodsUseTxt.htmlText = LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + this._vo.goodsCnt + "</font><br>";
         }
      }
      
      public function setZhenFaTiSheng(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.previousButton.enabled = false;
            this._chuangGuanBtn.enabled = false;
            this.nextButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(param2 >= this.LV_MAX)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this._chuangGuanBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this._chuangGuanBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this._chuangGuanBtn.enabled = false;
            }
         }
      }
      
      public function showTupoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this._chuangGuanCanvas.x == 138)
            {
               TweenMax.to(this._chuangGuanCanvas,1,{"x":410});
               this.tupoBo = true;
               this.previousButton.enabled = false;
               this.nextButton.enabled = false;
               this._chuangGuanBtn.enabled = false;
            }
         }
         else
         {
            if(this._chuangGuanCanvas.x == 410)
            {
               TweenMax.to(this._chuangGuanCanvas,1,{"x":138});
               this.$parent.dispatchEvent(new BaseEvent(TushidahuiConst.UI_TUSHIDAHUI_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.previousButton.enabled = true;
            this.nextButton.enabled = true;
            this._chuangGuanBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.previousButton.enabled = false;
            }
            if(this.lookingId >= this.LV_MAX)
            {
               this.nextButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this._chuangGuanCanvas.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setChuangGuanData(param1:TushidahuiChuangGuanVO) : void
      {
         this._chuangGuanCanvas.vo = param1;
      }
      
      public function setTupoInit(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this._chuangGuanCanvas.setTupoInit(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this._chuangGuanCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setTupoGoods(param1:Goods, param2:Boolean) : void
      {
         this._chuangGuanCanvas.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this._chuangGuanCanvas.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this._chuangGuanBtn.enabled = false;
         this._upgradeBtn.enabled = false;
      }
      
      private function reloadImg() : void
      {
         var _loc1_:int = this._vo.lookLv;
         if(this._vo.lookLv <= 0)
         {
            _loc1_ = 1;
         }
         else
         {
            _loc1_ = this._vo.lookLv;
         }
         if(this._bg != null && this._bg.parent != null)
         {
            this._bg.parent.removeChild(this._bg);
         }
         this._bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/tushidahui/" + _loc1_ + ".swf");
         if(this._vo.lookLv > this._vo.nowLv)
         {
            this._bg.filters = Tools.blackWhiteFilter;
         }
         this._bg.x = 3;
         this._bg.y = 7;
         addChildAt(this._bg,2);
      }
   }
}

