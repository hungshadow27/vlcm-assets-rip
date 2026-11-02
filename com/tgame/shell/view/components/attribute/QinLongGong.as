package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
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
   import com.tgame.moudels.qinlonggong.model.info.QinLongGongVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import gs.TweenMax;
   
   public class QinLongGong extends Sprite
   {
      
      public static const UI_QINLONGGONG_GUANBI_CLICK:String = "UI_QINLONGGONG_GUANBI_CLICK";
      
      private var bg1:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var qinlonggong:QinLongGongTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const QINLONGGONG_MAX:int = 6;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var p:Point;
      
      private var kuang:Bitmap;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var jinengSpr:Sprite;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var longxinshi:int = 0;
      
      private var fts5:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      public function QinLongGong()
      {
         var $mask:Sprite;
         var i:int;
         var box:FCanvas = null;
         var title:FTextArea = null;
         var fjjn:FTextArea = null;
         super();
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 0;
         box.width = 403;
         box.height = 366;
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/qinlonggong/bg.swf");
         this.bg1.x = 2;
         this.bg1.y = 2;
         addChild(this.bg1);
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 2;
         box.y = 231 + 32;
         box.width = 400;
         box.height = 135 - 32;
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 52 + 50;
         this.bloodMcSpr.y = 0;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37;
         this.shangyiyeButton.y = 205 + 25;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.multiline = true;
         this.cengshu.autoSize = TextFieldAutoSize.LEFT;
         this.cengshu.wordWrap = true;
         this.cengshu.width = 150;
         this.cengshu.height = 30;
         this.cengshu.x = 180 - 50 + 13 + 37;
         this.cengshu.y = 205 + 25;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 205 + 25;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50;
         this.tishengBtn.y = 205 + 25;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 24 + 50;
         title.y = 250 + 20;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("擒龙功") + "</font></textformat>";
         addChild(title);
         this.miaoshu = new FTextArea();
         this.miaoshu.autoSize;
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 230 - 30;
         this.miaoshu.x = 24 - 10;
         this.miaoshu.y = 270 + 10 + 10;
         this.miaoshu.htmlText = "<font  size = \'14\' color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13;
         this.shuxing.y = 250 + 20;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         this.shuxing.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("增加属性：") + "<br>1000<br>222<br>333<br>444<br>555</font>";
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9;
         fjjn.y = 255 + 5 + 5 + 6;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font size = \'16\'color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能") + "</font></textformat>";
         addChild(fjjn);
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 8;
         fjjn.y = 255 + 5 + 5 + 75;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("擒龙功") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 25;
         this.kuang.y = 160 + 35;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2;
         this.mainSkillContainer.y = 160 + 2 + 35;
         addChild(this.mainSkillContainer);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2;
         this.kuang.y = 300 - 2;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325;
         this.jinengSpr.y = 300;
         addChild(this.jinengSpr);
         this.qinlonggong = new QinLongGongTupoCanvas();
         addChild(this.qinlonggong);
         this.qinlonggong.x = 138;
         this.qinlonggong.y = 0;
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
         this.qinlonggong.mask = $mask;
         addEventListener(UI_QINLONGGONG_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts = new FTextArea();
         this.fts.x = 256;
         this.fts.y = 7;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.filters = StaticValue.filter;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("擒龙功顶级属性已激活");
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("擒龙功顶级属性已激活") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击1088888。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.RED;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("擒龙降虎帝尊式(未激活)");
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击22888888、防御11888888、血量888888888、暴击4888、闪避4888，所有武功提升十二层") + "<br>" + LanResManager.getLanCommonTextWords("擒龙降虎帝尊式无上绝学：将可以不出手，即可100%免疫抵抗擒龙功。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("擒龙战神册(已激活)");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击26888888 防御 20888888 血量30888888 暴击 888 闪避888 所有武功提升10层") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：使用后即可让自身的龙爪技能触发冷却时间减半！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("龙爪天赋神技激活秘籍(已激活)");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2088888888 防御1688888888 暴击2888 闪避2888血量2088888888、所有武功提升2180层") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：激活龙爪天赋神技后，玩家每次使用龙爪攻击对手，都将使对手在30秒内每秒持续掉血5%的当前血量") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 20 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("擒龙隐藏心法(已激活)");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击28888亿、防御26888亿、血量30888亿、所有武功提升 240000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：激活该秘籍后，可使用龙心石进行养成属性，每次可增加攻击200亿，所有武功提升10000层！（最多可养成5000次！）") + "<br>" + LanResManager.getLanCommonTextWords("当前已加成") + longxinshi + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + longxinshi * 200 + LanResManager.getLanCommonTextWords("亿，所有武功提升") + longxinshi * 10000 + LanResManager.getLanCommonTextWords("层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 7 + 20 + 20 + 20 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("双龙鬼爪秘籍(已激活)");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("双龙鬼爪：攻击8888888889000 防御6288888889000 血量9088888889000暴击 88888闪避88888  所有武功1000000层") + "<br>" + LanResManager.getLanCommonTextWords("★  双龙鬼爪—— 传闻为上古龙神自创绝技，领悟此绝技玩家将可以连续使用两次龙爪，达到双重龙爪双眩晕效果。！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuangSpr = new Sprite();
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288 + 188;
         this.equipContainers.y = 322 - 73 + 1 - 65;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         i = 0;
         while(i < 5)
         {
            this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.kuangSpr.addChild(this.kuangHD);
            this.kuangHD.x = 10 + 40 * i + 188;
            this.kuangHD.y = 266 - 2 - 1 - 10 - 65;
            i++;
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QINLONGGONG_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QINLONGGONG_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               if(this.tupoBo)
               {
                  return;
               }
               if(this.qinlonggong.x > 138)
               {
                  return;
               }
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QINLONGGONG_TUPO_CLICK,"",this.lookingId));
         }
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QINLONGGONG_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.qinlonggong._parent2 = param1;
         this.qinlonggong._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:QinLongGongVo) : void
      {
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.baoji,param2.shanbi);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.YCskillid,param2.YCisLearn,param2.skillid,param2.isLearn);
         this.setDingjiShuxing(param2.isDingjiShuxing);
         this.setJiHuo2(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.textColor = StaticValue.GREEN;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("擒龙降虎帝尊式(已激活)");
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("擒龙降虎帝尊式(未激活)");
         }
      }
      
      public function setJiHuo2(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.QINLONGGONG_SHENCHE_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.QINLONGGONG_LONGZHUATIANFU_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.QINLONGGONG_YINCANG_ID];
            this.longxinshi = GameState.dictMainStatus[SpecialGoodsID.QINLONGGONG_LONGXINSHI_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.QINLONGGONG_SHUANGLONGGUIZHUA_ID];
         }
         else
         {
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.QINLONGGONG_SHENCHE_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.QINLONGGONG_LONGZHUATIANFU_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.QINLONGGONG_YINCANG_ID];
            this.longxinshi = GameState.dictTargetStatus[SpecialGoodsID.QINLONGGONG_LONGXINSHI_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.QINLONGGONG_SHUANGLONGGUIZHUA_ID];
         }
         if(param1)
         {
            this.kuangHD.visible = !GameInstance.mainCharData.isDiZi;
            this.kuangSpr.visible = !GameInstance.mainCharData.isDiZi;
         }
         else
         {
            this.kuangHD.visible = !GameInstance.lookPlayerData.isDiZi;
            this.kuangSpr.visible = !GameInstance.lookPlayerData.isDiZi;
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = id;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/qinlonggong/" + mcId + ".swf";
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
      
      public function setShuxingJiacheng(param1:String, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
         this.shuxing.htmlText = "<textformat leading=\'2\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("增加属性：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param5 + "</font></textformat>";
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
            if(param2 >= this.QINLONGGONG_MAX)
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
      
      public function setSkill(param1:int, param2:Boolean, param3:int, param4:Boolean) : void
      {
         var _loc7_:ItemFace = null;
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(this.mainSkillItemFace)
         {
            if(this.mainSkillItemFace.parent)
            {
               this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
            }
         }
         var _loc5_:Skill = new Skill(param1);
         this.mainSkill = _loc5_;
         if(param2)
         {
            this.mainSkill.isLearn = 1;
         }
         else
         {
            this.mainSkill.isLearn = 0;
         }
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc6_:Skill = new Skill(param3);
         if(param4)
         {
            _loc6_.isLearn = 1;
         }
         else
         {
            _loc6_.isLearn = 0;
         }
         _loc7_ = new ItemFace(_loc6_);
         _loc7_.showKungFuTag();
         _loc7_.setShowCount(false);
         this.jinengSpr.addChild(_loc7_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.qinlonggong.x == 138)
            {
               TweenMax.to(this.qinlonggong,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.qinlonggong.x == 410)
            {
               TweenMax.to(this.qinlonggong,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QINLONGGONG_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.QINLONGGONG_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.qinlonggong.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.qinlonggong.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.qinlonggong.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.qinlonggong.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.qinlonggong.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      public function setDingjiShuxing(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.visible = true;
         }
         else
         {
            this.fts.visible = false;
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_QinLongGong(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE1)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE2)
            {
               _loc4_.x = 40 + 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE3)
            {
               _loc4_.x = 40 + 4 + 1 + 40;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE4)
            {
               _loc4_.x = 40 + 4 + 1 + 80;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE5)
            {
               _loc4_.x = 40 + 4 + 1 + 80 + 40;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

