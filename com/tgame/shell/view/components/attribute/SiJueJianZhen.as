package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.sijuejianzhen.model.info.SiJueJianZhenVo;
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
   
   public class SiJueJianZhen extends Sprite
   {
      
      public static const UI_SIJUEJIANZHEN_GUANBI_CLICK:String = "UI_SIJUEJIANZHEN_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var sijuejianzhen:SiJueJianZhenTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const CANHEZHI_MAX:int = 5;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var fts1:FTextArea;
      
      private var checkWq:FCheckBox;
      
      private var fts2:FTextArea;
      
      private var checkTx:FCheckBox;
      
      private var fts3:FTextArea;
      
      private var kaifengshi:Boolean = false;
      
      public function SiJueJianZhen()
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
         box.x = 2;
         box.y = 231 + 32 - 25;
         box.width = 400;
         box.height = 135 - 32 + 25;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/sijuejianzhen/bg.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         addChild(this.bg);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37 + 6;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 7 + 20;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170 + 6;
         this.cengshu.y = 230 - 20 + 25 - 18 - 3 + 7 + 20;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 + 6;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 7 + 20;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50 + 20 + 17;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 18 - 3 - 3 + 7 + 20;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 24 + 50;
         title.y = 250 + 12 - 15 + 23 - 21 - 13;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("七杀阵") + "</font></textformat>";
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 230 - 12;
         this.miaoshu.x = 23;
         this.miaoshu.y = 288 + 7 - 21 - 15;
         this.miaoshu.htmlText = "";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100 + 10 + 20;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13 + 14;
         this.shuxing.y = 288 + 7 - 21 - 15;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36;
         fjjn.y = 255 + 5 + 5 + 6 + 22;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("顶级技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33;
         this.kuang.y = 300 - 2 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.sijuejianzhen = new SiJueJianZhenTupoCanvas();
         addChild(this.sijuejianzhen);
         this.sijuejianzhen.x = 138;
         this.sijuejianzhen.y = 0;
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
         this.sijuejianzhen.mask = $mask;
         addEventListener(UI_SIJUEJIANZHEN_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8 - 270;
         this.equipContainers.y = 12 + 30 + 135 + 15;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 77 + 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 110;
         this.fts1.height = 20;
         this.fts1.htmlText = "霸刀";
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "霸刀：霸气无理，霸权至上。人物可在四绝剑阵界面激活显示。" + "<br>" + "攻击：80888亿、防御60888亿、血量80888亿、 所有武功提升 600000层" + "<br>" + "霸刀：攻击时100%触发霸刀，持续10秒；霸刀强大霸气压制全场，霸刀存在的地方区域内的一切都会" + "<br>" + "受到影响。在此状态下，对手周围的空气压强异常厚重，呼吸都十分困难，每次跳跃都无法正常跳起，" + "<br>" + "且会掉落在地使得全身麻痹，持续5秒；且对手在此状态下，每次触发技能攻击自身时都因霸刀的压" + "<br>" + "制偏离方向，击向地面；且自身在此状态下，每攻击对手2次就会形成一个霸刀标形打在对手身上，" + "<br>" + "使得对手受到组合打击损失80%的血量。冷却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.visible = false;
         this.checkWq.x = 80;
         this.checkWq.y = 77 + 7;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 77 + 7 + 25;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 110;
         this.fts2.height = 20;
         this.fts2.htmlText = "红龙";
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "红龙：红龙愤怒的化身，常年与红龙相伴。人物可在四绝剑阵界面激活显示。" + "<br>" + "攻击：80888亿、防御60888亿、血量80888亿、 所有武功提升 600000层" + "<br>" + "红龙：攻击时100%触发红龙之怒，持续20秒；在红龙召唤出来存在期间，对手的全身经脉都将被" + "<br>" + "怒气震裂尽断，对手因经脉尽断内力全失无法做任何操作（该效果不可清除）；且对手在经脉尽" + "<br>" + "断状态下，无法自己治愈恢复，攻击速度、移动速度都受到身体机能下降影响，剩余1点（该效" + "<br>" + "果不可清除）；当状态解除时，红龙幻灭进入体内，红色怒气使自身进入无敌状态，持续10秒。" + "<br>" + "冷却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkTx = new FCheckBox();
         addChild(this.checkTx);
         this.checkTx.visible = false;
         this.checkTx.x = 80;
         this.checkTx.y = 77 + 7 + 25;
         this.checkTx.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 77 + 7 + 25 * 2;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20;
         this.fts3.htmlText = "吞噬苍穹";
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 500000层" + "<br>" + "吞噬苍穹：攻击时100%触发吞噬苍穹，持续10秒；在此状态下，吞噬对手坐骑和一切，任何力量都将" + "<br>" + "无法抵抗，自身因吞噬之尽瞬间清除自身的所有负面状态；且命中吞噬苍穹BUFF的对手将无法召唤自" + "<br>" + "己的坐骑并且不能对任何人进行任何操作。该状态不可清除。冷却60秒." + "<br>";
            _loc1_ += "</textformat>";
            if(kaifengshi)
            {
               _loc1_ += "吞噬开封石：双击使用开封吞噬苍穹的封禁之力，使得吞噬苍穹BUFF存在时间延长到20秒。" + "<br>";
            }
            return _loc1_;
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkWq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq.selectState,315]));
               break;
            case this.checkTx:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkTx.selectState,316]));
         }
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SIJUEJIANZHEN_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SIJUEJIANZHEN_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SIJUEJIANZHEN_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.sijuejianzhen._parent2 = param1;
         this.sijuejianzhen._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:SiJueJianZhenVo) : void
      {
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillId,param2.isLearn);
         this.setJiHuo(param1);
         this.checkWq.selectState = param2.isWuQi;
         this.checkTx.selectState = param2.isTeXiao;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.SIJUEJIANZHEN_HONGLONG];
            this.checkTx.visible = GameState.dictMainStatus[SpecialGoodsID.SIJUEJIANZHEN_HONGLONG];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.SIJUEJIANZHEN_TUNSHICANGQIONG_ID];
            this.kaifengshi = GameState.dictMainStatus[SpecialGoodsID.SIJUEJIANZHEN_KAIFENGSHI_ID];
         }
         else
         {
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.SIJUEJIANZHEN_HONGLONG];
            this.checkTx.visible = GameState.dictTargetStatus[SpecialGoodsID.SIJUEJIANZHEN_HONGLONG];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.SIJUEJIANZHEN_TUNSHICANGQIONG_ID];
            this.kaifengshi = GameState.dictTargetStatus[SpecialGoodsID.SIJUEJIANZHEN_KAIFENGSHI_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var loadUrl:String = null;
         var mcId:int = param1;
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/sijuejianzhen/" + mcId + ".swf";
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
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成") + "：<br>" + LanResManager.getLanCommonTextWords("攻击:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param6 + "</font>";
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
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
            if(this.sijuejianzhen.x == 138)
            {
               TweenMax.to(this.sijuejianzhen,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.sijuejianzhen.x == 410)
            {
               TweenMax.to(this.sijuejianzhen,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SIJUEJIANZHEN_ZIDONGTISHENG_CLICK,"",false));
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
         if(this.sijuejianzhen.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.sijuejianzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.sijuejianzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.sijuejianzhen.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.sijuejianzhen.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_SiJueJianZhen(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_SIJUEJIANZHEN_BADAO)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 0;
               this.kuangHD.y = 0;
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq.visible = true;
                  this.fts1.visible = true;
               }
               else
               {
                  this.checkWq.visible = false;
                  this.fts1.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

