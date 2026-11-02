package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.kongmingquan.model.info.KongMingQuanVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class KongMingQuan extends Sprite
   {
      
      public static const UI_KONGMINGQUAN_GUANBI_CLICK:String = "UI_KONGMINGQUAN_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var kongmingquan:KongMingQuanTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const CANHEZHI_MAX:int = 6;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var fts1:FTextArea;
      
      private var qishou:Boolean = false;
      
      private var taitui:Boolean = false;
      
      private var lianhuan:Boolean = false;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var fujia:FTextArea;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      public function KongMingQuan()
      {
         var title:FTextArea;
         var fjjn:FTextArea;
         var $mask:Sprite;
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
         addChild(box);
         box.x = 403 - 172;
         box.y = 2;
         box.width = 170;
         box.height = 362;
         box = new FCanvas();
         box.skin = "box_transparence";
         addChild(box);
         box.x = 403 - 171 + 1;
         box.y = 127 + 19;
         box.width = 166;
         box.height = 162 - 19;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/kongmingquan/bg.swf");
         this.bg.x = 3;
         this.bg.y = 3;
         addChild(this.bg);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 129 - 52 - 44 - 30;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37 - 102 - 13;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 106 + 17;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170 - 102 - 13;
         this.cengshu.y = 230 - 20 + 25 - 18 - 3 + 106 + 17;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 - 102 - 13;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 106 + 17;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50 + 20 - 102 - 59;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 18 - 3 - 3 + 106 + 17;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 293;
         title.y = 9;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("空明拳") + "</font></textformat>";
         addChild(title);
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 167;
         this.miaoshu.x = 237;
         this.miaoshu.y = 35;
         this.miaoshu.htmlText = "";
         this.shuxing = new FTextArea();
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.autoSize = TextFieldAutoSize.LEFT;
         this.shuxing.x = 210 + 13 + 17;
         this.shuxing.y = 165;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36 - 68 + 9;
         fjjn.y = 255 + 5 + 5 + 6 + 22;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("顶级技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33 - 68 + 5;
         this.kuang.y = 300 - 2 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33 - 68 + 5;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.kongmingquan = new KongMingQuanTupoCanvas();
         addChild(this.kongmingquan);
         this.kongmingquan.x = 138;
         this.kongmingquan.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -5;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.kongmingquan.mask = $mask;
         addEventListener(UI_KONGMINGQUAN_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170 + 20;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("空明总诀式（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("空明总诀式") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：攻击88888亿 防御62888亿 血量90888亿 暴击 88888闪避88888") + "<br>" + LanResManager.getLanCommonTextWords("所有武功1400000层") + "<br>" + LanResManager.getLanCommonTextWords("空明总诀：攻击时100%触发空明总诀式，持续10秒；在此状态下，在原地时格档") + "<br>" + LanResManager.getLanCommonTextWords("下对手所有玩家的攻击伤害和对手技能效果；自身每次移动一次或跳跃一次，都") + "<br>" + LanResManager.getLanCommonTextWords("将使对手的攻击无效化，且自身每攻击对手一次，直接命中对手的技能，使对手") + "<br>" + LanResManager.getLanCommonTextWords("的技能被抵消无法在使用，持续10秒。冷却60秒。") + "<br>";
            if(qishou)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("空明起手式：被攻击时有几率触发空明起手式，持续10秒；自身将免疫对手对手技能效果。") + "<br>";
            }
            if(taitui)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("空明抬腿式：被攻击时有几率触发空明抬腿式，持续10秒；被攻击一次都将反弹眩晕对手5秒。") + "<br>";
            }
            if(lianhuan)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("空明连环式：被攻击时有几率触发空明连环式，持续10秒；每跳跃一次5格内的所有对手都将双") + "<br>" + LanResManager.getLanCommonTextWords("足失去知觉，无法移动，持续5秒。") + "<br>";
            }
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_KONGMINGQUAN_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_KONGMINGQUAN_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_KONGMINGQUAN_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.kongmingquan._parent2 = param1;
         this.kongmingquan._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:KongMingQuanVo) : void
      {
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.setJiHuo(param1);
      }
      
      private function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.KONGMINGQUAN_ZONGJUESHI_ID];
            this.qishou = GameState.dictMainStatus[SpecialGoodsID.KONGMINGQUAN_QISHOUSHI_ID];
            this.taitui = GameState.dictMainStatus[SpecialGoodsID.KONGMINGQUAN_TAITUISHI_ID];
            this.lianhuan = GameState.dictMainStatus[SpecialGoodsID.KONGMINGQUAN_LIANHUANSHI_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.KONGMINGQUAN_ZONGJUESHI_ID];
            this.qishou = GameState.dictTargetStatus[SpecialGoodsID.KONGMINGQUAN_QISHOUSHI_ID];
            this.taitui = GameState.dictTargetStatus[SpecialGoodsID.KONGMINGQUAN_TAITUISHI_ID];
            this.lianhuan = GameState.dictTargetStatus[SpecialGoodsID.KONGMINGQUAN_LIANHUANSHI_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var loadUrl:String = null;
         var id:int = param1;
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/kongmingquan/" + id + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[id] != null)
         {
            this.bloodMc = this.mcObj[id];
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
               mcObj[id] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
      }
      
      public function setShuxingJiacheng(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param6 + "</font>";
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
            this.tishengBtn.enabled = false;
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            else
            {
               this.shangyiyeButton.enabled = true;
            }
            if(param2 >= this.CANHEZHI_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
            else
            {
               this.xiayiyeButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.tishengBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
               this.tishengBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.tishengBtn.enabled = false;
            }
         }
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         var _loc4_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         _loc4_ = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         this.jinengSpr.addChild(_loc4_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.kongmingquan.x == 138)
            {
               TweenMax.to(this.kongmingquan,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.kongmingquan.x == 410)
            {
               TweenMax.to(this.kongmingquan,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_KONGMINGQUAN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.CANHEZHI_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.kongmingquan.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.kongmingquan.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.kongmingquan.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.kongmingquan.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.kongmingquan.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
   }
}

