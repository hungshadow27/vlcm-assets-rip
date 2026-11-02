package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.duguqiubai.model.info.DuGuQiuBaiVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class DuGuQiuBai extends Sprite
   {
      
      private var _$parent:DisplayObject;
      
      public const DUGUQIUBAI_MAX:int = 5;
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var zidongBtn:SecondButton;
      
      private var goumaiBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var act:Number = 0;
      
      private var def:Number = 0;
      
      private var shengming:Number = 0;
      
      private var baoji:Number = 0;
      
      private var shanbi:Number = 0;
      
      private var wugong:int = 0;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var zhufuzhi:int;
      
      private var img:Bitmap;
      
      private var CjBar:ColorBar;
      
      private var xingyunzhiNum:int;
      
      private var lookingId:int = 0;
      
      private var nowId:int = 0;
      
      private var goodsId:int;
      
      private var item:ItemFace;
      
      private var chuanqishuxing:FTextArea;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var biaoti:FTextArea;
      
      private var xiaohao:FTextArea;
      
      public function DuGuQiuBai()
      {
         var box:FCanvas = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 0;
         box.width = 403;
         box.height = 366;
         box = new FCanvas();
         box.skin = "box";
         box.x = 2;
         box.y = 231 + 32 - 25;
         box.width = 400;
         box.height = 135 - 32 + 25;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/duguqiubai/bg.swf");
         this.bg.x = 0;
         this.bg.y = 2;
         addChild(this.bg);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37;
         this.shangyiyeButton.y = 180;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170;
         this.cengshu.y = 180;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 180;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.biaoti = new FTextArea();
         addChild(this.biaoti);
         this.biaoti.multiline = true;
         this.biaoti.wordWrap = true;
         this.biaoti.width = 230 - 12;
         this.biaoti.x = 50 - 20;
         this.biaoti.y = 210 + 5;
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 335 + 35;
         this.miaoshu.x = 23 - 11 + 20 - 15;
         this.miaoshu.y = 288 + 7 - 18 - 40;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         this.xiaohao = new FTextArea();
         addChild(this.xiaohao);
         this.xiaohao.multiline = true;
         this.xiaohao.wordWrap = true;
         this.xiaohao.width = 150;
         this.xiaohao.x = 80;
         this.xiaohao.y = 295 + 2;
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13 + 17;
         this.shuxing.y = 250 + 20 - 3;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 236;
         this.tishengBtn.y = 300;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("境界突破");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zidongBtn = new SecondButton();
         addChild(this.zidongBtn);
         this.zidongBtn.x = 236;
         this.zidongBtn.y = 330;
         this.zidongBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         this.zidongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.img = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.img);
         this.img.x = 75;
         this.img.y = 325 + 20 + 2;
         this.CjBar = new ColorBar(5,123,8);
         addChild(this.CjBar);
         this.CjBar.x = 75 + 4;
         this.CjBar.y = 325 + 3 + 20 + 1;
         this.CjBar.setValue(2,2);
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 337 + 10 + 1;
         this.jinengSpr.y = 294 + 10 - 1;
         addChild(this.jinengSpr);
         this.mcObj = new Array();
         this.chuanqishuxing = new FTextArea();
         this.chuanqishuxing.x = 265;
         this.chuanqishuxing.y = 210 + 5;
         this.chuanqishuxing.textColor = StaticValue.GREEN;
         this.chuanqishuxing.width = 170;
         this.chuanqishuxing.height = 20;
         this.chuanqishuxing.htmlText = "<font size = \'14\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("传奇属性") + "</font>";
         addChild(this.chuanqishuxing);
         ToolTips.createToolTips(this.chuanqishuxing,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("当前属性增加：") + "<br>" + LanResManager.getLanCommonTextWords("攻击力：") + act + "<br>" + LanResManager.getLanCommonTextWords("防御力：") + def + "<br>" + LanResManager.getLanCommonTextWords("血量：") + shengming + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + baoji + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + shanbi + "<br>" + LanResManager.getLanCommonTextWords("武功层数：") + wugong + "<br>" + LanResManager.getLanCommonTextWords("传奇最高境界时可获得独孤求败专属外形。");
            return _loc1_ + "</font></textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 310;
         this.check.y = 340;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,1]));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_SHANGYIYE_CLICK));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_XIAYIYE_CLICK));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_KAISHITISHENG_CLICK));
               break;
            case this.zidongBtn:
               if(this.zidongBtn.label == LanResManager.getLanCommonTextWords("自动突破"))
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_ZIDONGTISHENG_CLICK,"",true));
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_ZIDONGTISHENG_CLICK,"",false));
               }
               break;
            case this.goumaiBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:DuGuQiuBaiVO) : void
      {
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.hp,param2.shanbi,param2.def,param2.baoji,param2.wugong);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.isLearn,param2.huanzhuang);
         this.xiaohao.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("每次突破境界，需要消耗独孤剑术残本或超级元素精华*") + param2.count + "</font>";
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.goodsId = param1.id;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 21;
         this.item.y = 294 + 10 - 1;
         addChild(this.item);
         if(!param2)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.item.filters = [];
         }
      }
      
      public function setShuxingJiacheng(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:int) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param1 + "</font>";
         this.act = param2;
         this.def = param5;
         this.shengming = param3;
         this.baoji = param6;
         this.shanbi = param4;
         this.wugong = param7;
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.biaoti.htmlText = "<font size = \'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + param1 + "</font>";
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(param2 <= 1)
         {
            this.shangyiyeButton.enabled = false;
         }
         else
         {
            this.shangyiyeButton.enabled = true;
         }
         if(param2 >= this.DUGUQIUBAI_MAX)
         {
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            this.xiayiyeButton.enabled = true;
         }
         if(param2 < param3 + 1)
         {
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("已突破");
            this.tishengBtn.enabled = false;
            this.zidongBtn.enabled = false;
         }
         else if(param2 == param3 + 1)
         {
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("境界突破");
            this.tishengBtn.enabled = true;
            this.zidongBtn.enabled = true;
         }
         else if(param2 > param3 + 1)
         {
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可突破");
            this.tishengBtn.enabled = false;
            this.zidongBtn.enabled = false;
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = id;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/duguqiubai/" + mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[mcId] != null)
         {
            this.bloodMc = this.mcObj[mcId];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function setSkill(param1:Boolean, param2:Boolean) : void
      {
         var _loc4_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(310005,true);
         _loc4_ = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         this.jinengSpr.addChild(_loc4_);
         if(!param1)
         {
            _loc4_.filters = Tools.blackWhiteFilter;
            this.check.enabled = false;
         }
         else
         {
            _loc4_.filters = [];
            this.check.enabled = true;
         }
         this.check.selectState = param2;
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.zhufuzhi = param1;
         if(param1 > param2)
         {
            this.CjBar.setValue(param2,param2);
         }
         else
         {
            this.CjBar.setValue(param1,param2);
         }
         if(param3 != 0)
         {
            this.xingyunzhiNum = param3;
         }
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.zidongBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         }
         else
         {
            this.zidongBtn.label = LanResManager.getLanCommonTextWords("停止突破");
         }
      }
      
      public function setEnableFun() : void
      {
         this.tishengBtn.enabled = false;
         this.zidongBtn.enabled = false;
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.check.enabled = false;
      }
      
      private function aa(param1:Event = null) : void
      {
         var e:Event = param1;
         var ftaw:FTextArea = new FTextArea();
         with(ftaw)
         {
            filters = StaticValue.filter;
            x = 69;
            y = 152;
            textColor = StaticValue.YELLOW;
            width = 132;
            htmlText = LanResManager.getLanCommonTextWords("灵值+") + String(xingyunzhiNum);
         }
         addChild(ftaw);
         TweenMax.to(ftaw,1,{
            "y":100,
            "onComplete":this.onCom,
            "onCompleteParams":[ftaw]
         });
      }
      
      private function onCom(param1:FTextArea) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      public function reBtnLable() : String
      {
         return this.zidongBtn.label;
      }
   }
}

