package com.tgame.shell.view.components.xianmozhilu
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ZhongZuJieMian_TianWen extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var boxContainer:Sprite;
      
      private var effectContainer:Sprite;
      
      private var mainSkillContainer:Sprite;
      
      private var baihu:FLabel;
      
      private var zhuque:FLabel;
      
      private var xuanwu:FLabel;
      
      private var qinglong:FLabel;
      
      private var xiaohao:FLabel;
      
      private var beibao:FLabel;
      
      private var txtTip:FLabel;
      
      private var btnShengJie:NewSkinButton;
      
      private var txtXianMoJueXingJi:FTextArea;
      
      private var imgSkill:DisplayObject;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft4:FTextArea;
      
      private var check4:FCheckBox;
      
      private var ft5:FTextArea;
      
      private var check5:FCheckBox;
      
      private var ft6:FTextArea;
      
      private var ft7:FTextArea;
      
      private var ft8:FTextArea;
      
      private var ft9:FTextArea;
      
      private var ft10:FTextArea;
      
      private var kuangHD1:Bitmap;
      
      private var item1:ItemFace;
      
      private var kuangHD2:Bitmap;
      
      private var item2:ItemFace;
      
      private var arrStar:Array;
      
      private var heroHeadMC:MovieClip;
      
      private var heroEffectMC:MovieClip;
      
      private var cunrrIndex:int = 0;
      
      private var currActived:int = 0;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      public function ZhongZuJieMian_TianWen()
      {
         var bg:DisplayObject;
         var zi:DisplayObject;
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianwen/bg.swf");
         bg.x = 10;
         bg.y = 22;
         addChild(bg);
         zi = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianwen/zi.swf");
         zi.x = 140;
         zi.y = 115;
         addChild(zi);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         this.effectContainer = new Sprite();
         addChild(this.effectContainer);
         this.effectContainer.mouseChildren = false;
         this.effectContainer.mouseEnabled = false;
         this.initEffect();
         this.initStar();
         this.baihu = new FLabel();
         this.baihu.textColor = StaticValue.YELLOW;
         this.baihu.filters = StaticValue.filter;
         this.baihu.x = 290 + 95;
         this.baihu.y = 190 - 48;
         addChild(this.baihu);
         this.zhuque = new FLabel();
         this.zhuque.textColor = StaticValue.YELLOW;
         this.zhuque.filters = StaticValue.filter;
         this.zhuque.x = 290 + 95;
         this.zhuque.y = 210 - 50;
         addChild(this.zhuque);
         this.xuanwu = new FLabel();
         this.xuanwu.textColor = StaticValue.YELLOW;
         this.xuanwu.filters = StaticValue.filter;
         this.xuanwu.x = 290 + 95;
         this.xuanwu.y = 230 - 52;
         addChild(this.xuanwu);
         this.qinglong = new FLabel();
         this.qinglong.textColor = StaticValue.YELLOW;
         this.qinglong.filters = StaticValue.filter;
         this.qinglong.x = 290 + 95;
         this.qinglong.y = 250 - 54;
         addChild(this.qinglong);
         this.xiaohao = new FLabel();
         this.xiaohao.textColor = StaticValue.YELLOW;
         this.xiaohao.filters = StaticValue.filter;
         this.xiaohao.x = 80 + 120;
         this.xiaohao.y = 315 + 9;
         addChild(this.xiaohao);
         this.beibao = new FLabel();
         this.beibao.textColor = StaticValue.YELLOW;
         this.beibao.filters = StaticValue.filter;
         this.beibao.x = 80 + 120;
         this.beibao.y = 335 + 8;
         addChild(this.beibao);
         this.txtTip = new FLabel();
         this.txtTip.textColor = StaticValue.GREEN;
         this.txtTip.filters = StaticValue.filter;
         this.txtTip.text = "天灵获得途径";
         this.txtTip.x = 300;
         this.txtTip.y = 330;
         this.txtTip.visible = false;
         addChild(this.txtTip);
         ToolTips.createToolTips(this.txtTip,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "玩家可通过每日充值" + "<br>" + "或运营活动获得天灵" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.equipContainers = new Sprite();
         addChild(this.equipContainers);
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         this.btnShengJie = new NewSkinButton();
         this.btnShengJie.skin = "tianwen_Button";
         this.btnShengJie.x = 125;
         this.btnShengJie.y = 360;
         addChild(this.btnShengJie);
         this.btnShengJie.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.txtXianMoJueXingJi = new FTextArea();
         this.txtXianMoJueXingJi.x = 30;
         this.txtXianMoJueXingJi.y = 45;
         this.txtXianMoJueXingJi.textColor = StaticValue.GREEN;
         this.txtXianMoJueXingJi.width = 70;
         this.txtXianMoJueXingJi.height = 20;
         this.txtXianMoJueXingJi.htmlText = "仙魔觉醒技";
         this.txtXianMoJueXingJi.visible = false;
         addChild(this.txtXianMoJueXingJi);
         ToolTips.createToolTips(this.txtXianMoJueXingJi,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：仙魔满级时自身觉醒属性获得翻倍效果；" + "<br>" + "特殊技能：战斗状态下100%反噬对手一个仙魔觉醒技，对手每次操作都将会掉落1%当前血" + "<br>" + "量，且在此期间内无法恢复血量，持续15秒，冷却90秒。" + "（对仙魔转生及非转生均有效！）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.imgSkill = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianwen/skill.swf");
         this.imgSkill.x = 360;
         this.imgSkill.y = 250;
         addChild(this.imgSkill);
         ToolTips.createToolTips(this.imgSkill,this,function():String
         {
            var _loc1_:String = "";
            return getSkillTipByIndex();
         });
         this.mainSkillContainer = new Sprite();
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.ft1 = new FTextArea();
         this.ft1.x = 15;
         this.ft1.y = 30;
         this.ft1.textColor = StaticValue.GREEN;
         this.ft1.filters = Tools.borderFilter;
         this.ft1.width = 70;
         this.ft1.height = 20;
         this.ft1.htmlText = "天纹觉醒石";
         this.ft1.visible = false;
         addChild(this.ft1);
         ToolTips.createToolTips(this.ft1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：激活后增加人物全属性2000%" + "<br>" + "特殊属性：攻击1000888亿、防御800888亿、血量800888亿、所有武功提升1000000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft2 = new FTextArea();
         this.ft2.x = 15;
         this.ft2.y = 48;
         this.ft2.textColor = StaticValue.GREEN;
         this.ft2.filters = Tools.borderFilter;
         this.ft2.width = 70;
         this.ft2.height = 20;
         this.ft2.htmlText = "天纹属性石 ";
         this.ft2.visible = false;
         addChild(this.ft2);
         ToolTips.createToolTips(this.ft2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：激活后增加人物全属性.300%" + "<br>" + "特殊属性：攻击1000888亿、防御800888亿、血量800888亿、所有武功提升1000000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft3 = new FTextArea();
         this.ft3.x = 15;
         this.ft3.y = 64;
         this.ft3.textColor = StaticValue.GREEN;
         this.ft3.filters = Tools.borderFilter;
         this.ft3.width = 70;
         this.ft3.height = 20;
         this.ft3.htmlText = "天纹觉醒技";
         this.ft3.visible = false;
         addChild(this.ft3);
         ToolTips.createToolTips(this.ft3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：战斗时100%触发天纹觉醒，持续15秒；在此状态下，对手受到天纹阵的效果影响，全身内力" + "<br>" + "体力全部消失，经脉受到封印全部无法触发任何操作效果；且天纹阵下的对手，只要触发无敌或其他状态" + "<br>" + "都将会导致其无敌破碎，且每秒受到天纹切割，失去70%的生命；当对手受到被攻击时，将会化成天纹阵，" + "<br>" + "一直存在原地不可离开，在天纹阵未消失前，对手一直处于黑暗中。冷却60秒。" + "<br>" + "天纹觉醒石：激活天纹觉醒石可将天纹的技能持续时间翻倍，冷却时间缩短一半。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft4 = new FTextArea();
         this.ft4.x = 15;
         this.ft4.y = 82;
         this.ft4.textColor = StaticValue.GREEN;
         this.ft4.filters = Tools.borderFilter;
         this.ft4.width = 70;
         this.ft4.height = 20;
         this.ft4.htmlText = "十方天断";
         this.ft4.visible = false;
         addChild(this.ft4);
         ToolTips.createToolTips(this.ft4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：战斗时100%触发天纹觉醒，持续15秒；在此状态下，对手受到天纹阵的效果影响，全身内力" + "<br>" + "体力全部消失，经脉受到封印全部无法触发任何操作效果；且天纹阵下的对手，只要触发无敌或其他状态" + "<br>" + "都将会导致其无敌破碎，且每秒受到天纹切割，失去70%的生命；当对手受到被攻击时，将会化成天纹阵，" + "<br>" + "一直存在原地不可离开，在天纹阵未消失前，对手一直处于黑暗中。冷却60秒。" + "<br>" + "天纹觉醒石：激活天纹觉醒石可将天纹的技能持续时间翻倍，冷却时间缩短一半。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check4 = new FCheckBox();
         addChild(this.check4);
         this.check4.x = 15 + 100;
         this.check4.y = 82;
         this.check4.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.ft5 = new FTextArea();
         this.ft5.x = 15;
         this.ft5.y = 100;
         this.ft5.textColor = StaticValue.GREEN;
         this.ft5.filters = Tools.borderFilter;
         this.ft5.width = 70;
         this.ft5.height = 20;
         this.ft5.htmlText = "傲剑进化石";
         this.ft5.visible = false;
         addChild(this.ft5);
         ToolTips.createToolTips(this.ft5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_395232).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check5 = new FCheckBox();
         this.check5.x = 15 + 100;
         this.check5.y = 100;
         this.check5.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.ft6 = new FTextArea();
         this.ft6.x = 15;
         this.ft6.y = 118;
         this.ft6.textColor = StaticValue.GREEN;
         this.ft6.filters = Tools.borderFilter;
         this.ft6.width = 85;
         this.ft6.height = 20;
         this.ft6.htmlText = "战神归来觉醒石";
         this.ft6.visible = false;
         addChild(this.ft6);
         ToolTips.createToolTips(this.ft6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_395556).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft7 = new FTextArea();
         this.ft7.x = 15;
         this.ft7.y = 136;
         this.ft7.textColor = StaticValue.GREEN;
         this.ft7.filters = Tools.borderFilter;
         this.ft7.width = 85;
         this.ft7.height = 20;
         this.ft7.htmlText = "投资丸";
         this.ft7.visible = false;
         addChild(this.ft7);
         ToolTips.createToolTips(this.ft7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_395915).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft8 = new FTextArea();
         this.ft8.x = 15;
         this.ft8.y = 154;
         this.ft8.textColor = StaticValue.GREEN;
         this.ft8.filters = Tools.borderFilter;
         this.ft8.width = 85;
         this.ft8.height = 20;
         this.ft8.htmlText = "七凶御灵石";
         this.ft8.visible = false;
         addChild(this.ft8);
         ToolTips.createToolTips(this.ft8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_401303).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft9 = new FTextArea();
         this.ft9.x = 15;
         this.ft9.y = 172;
         this.ft9.textColor = StaticValue.GREEN;
         this.ft9.filters = Tools.borderFilter;
         this.ft9.width = 85;
         this.ft9.height = 20;
         this.ft9.htmlText = "七凶御魂石";
         this.ft9.visible = false;
         addChild(this.ft9);
         ToolTips.createToolTips(this.ft9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_401304).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft10 = new FTextArea();
         this.ft10.x = 15;
         this.ft10.y = 190;
         this.ft10.textColor = StaticValue.GREEN;
         this.ft10.filters = Tools.borderFilter;
         this.ft10.width = 85;
         this.ft10.height = 20;
         this.ft10.htmlText = "七凶御妖石";
         this.ft10.visible = false;
         addChild(this.ft10);
         ToolTips.createToolTips(this.ft10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_401305).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.initMianSkill();
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.check4:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check4.selectState,SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_394809]);
               break;
            case this.check5:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check5.selectState,SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_395232]);
         }
      }
      
      private function initMianSkill() : void
      {
         var _loc1_:Skill = null;
         this.kuangHD1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangHD1.x = 20;
         this.kuangHD1.y = 252;
         _loc1_ = new Skill(200894);
         _loc1_.isLearn = 1;
         this.item1 = new ItemFace(_loc1_);
         this.item1.showKungFuTag();
         this.item1.setShowCount(false);
         this.item1.x = 22;
         this.item1.y = 254;
         this.mainSkillContainer.addChild(this.kuangHD1);
         this.mainSkillContainer.addChild(this.item1);
         this.kuangHD2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangHD2.x = 60;
         this.kuangHD2.y = 252;
         _loc1_ = new Skill(200899);
         _loc1_.isLearn = 1;
         this.item2 = new ItemFace(_loc1_);
         this.item2.showKungFuTag();
         this.item2.setShowCount(false);
         this.item2.x = 62;
         this.item2.y = 254;
         this.mainSkillContainer.addChild(this.kuangHD2);
         this.mainSkillContainer.addChild(this.item2);
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_MENU_SHOW,"",param1));
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new Event(ZhongZuJieMianPanel.UI_XIANMOTIANWEN_SHENGJIE));
      }
      
      private function initEffect() : void
      {
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            heroHeadMC = _loc2_.content as MovieClip;
            heroHeadMC.x = 15;
            heroHeadMC.y = 30;
            effectContainer.addChild(heroHeadMC);
         },null,false,GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianwen/1.swf");
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            heroHeadMC = _loc2_.content as MovieClip;
            heroHeadMC.x = 15;
            heroHeadMC.y = 30;
            effectContainer.addChild(heroHeadMC);
         },null,false,GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianwen/2.swf");
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            heroHeadMC = _loc2_.content as MovieClip;
            heroHeadMC.x = 15;
            heroHeadMC.y = 30;
            effectContainer.addChild(heroHeadMC);
         },null,false,GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianwen/3.swf");
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            heroHeadMC = _loc2_.content as MovieClip;
            heroHeadMC.x = 15;
            heroHeadMC.y = 30;
            effectContainer.addChild(heroHeadMC);
         },null,false,GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianwen/4.swf");
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            heroHeadMC = _loc2_.content as MovieClip;
            heroHeadMC.x = 15;
            heroHeadMC.y = 30;
            effectContainer.addChild(heroHeadMC);
         },null,false,GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianwen/5.swf");
      }
      
      private function initStar() : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:DisplayObject = null;
         this.arrStar = new Array();
         var _loc1_:int = 0;
         while(_loc1_ < 12)
         {
            _loc2_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/an.swf");
            _loc2_.x = _loc1_ * 21 + 60;
            _loc2_.y = 290;
            addChild(_loc2_);
            _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/liang.swf");
            _loc3_.x = _loc2_.x;
            _loc3_.y = _loc2_.y;
            addChild(_loc3_);
            this.arrStar.push(_loc3_);
            _loc1_++;
         }
      }
      
      public function setXianMoTianWenData(param1:Object) : void
      {
         this.removeItemBoxChildren();
         var _loc2_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianwen/star_" + param1.rank + ".swf");
         _loc2_.x = 20;
         _loc2_.y = 115;
         this.boxContainer.addChild(_loc2_);
         var _loc3_:int = 0;
         while(_loc3_ < 12)
         {
            if(_loc3_ < param1.star)
            {
               this.arrStar[_loc3_].visible = true;
            }
            else
            {
               this.arrStar[_loc3_].visible = false;
            }
            _loc3_++;
         }
         this.baihu.text = param1.baihu + "%";
         this.zhuque.text = param1.zhuque + "%";
         this.xuanwu.text = param1.xuanwu + "%";
         this.qinglong.text = param1.qinglong + "%";
         this.xiaohao.text = param1.xiaohao + "";
         this.cunrrIndex = param1.rank;
         this.currActived = param1.isActived;
         this.setGoodsChangeHandler();
         this.check4.selectState = param1.check4;
         this.check5.selectState = param1.check5;
         this.ft1.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANWENJUEXINGSHI];
         this.ft2.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANWENSHUXINGSHI];
         this.ft3.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANWENJUEXINGJI];
         this.ft4.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_394809];
         this.check4.visible = this.ft4.visible;
         this.ft5.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_395232];
         this.check5.visible = this.ft5.visible;
         this.ft6.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_395556];
         this.ft7.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_395915];
         this.ft8.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_401303];
         this.ft9.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_401304];
         this.ft10.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_401305];
         this.kuangHD1.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_MEIRENTUJIAN];
         this.item1.visible = this.kuangHD1.visible;
         this.kuangHD2.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_SANGUOXIAOXIONGLU];
         this.item2.visible = this.kuangHD2.visible;
      }
      
      public function getSkillTipByIndex() : String
      {
         var _loc1_:String = "";
         if(this.cunrrIndex > 1)
         {
            _loc1_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "第一层：受到对手攻击时，抵抗其1aa伤害，且无视对手总战纹10%。" + "<br>";
            _loc1_ += "</textformat>";
         }
         else
         {
            _loc1_ += "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + "第一层：受到对手攻击时，抵抗其1aa伤害，且无视对手总战纹10%。" + "<br>";
            _loc1_ += "</textformat>";
         }
         if(this.cunrrIndex > 2)
         {
            _loc1_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "第二层：受到对手攻击时，抵抗其100aa伤害，且无视对手总战纹30%。" + "<br>";
            _loc1_ += "</textformat>";
         }
         else
         {
            _loc1_ += "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + "第二层：受到对手攻击时，抵抗其100aa伤害，且无视对手总战纹30%。" + "<br>";
            _loc1_ += "</textformat>";
         }
         if(this.cunrrIndex > 3)
         {
            _loc1_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "第三层：受到对手攻击时，抵抗其1bb伤害，且无视对手总战纹50%。" + "<br>";
            _loc1_ += "</textformat>";
         }
         else
         {
            _loc1_ += "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + "第三层：受到对手攻击时，抵抗其1bb伤害，且无视对手总战纹50%。" + "<br>";
            _loc1_ += "</textformat>";
         }
         if(this.cunrrIndex > 4)
         {
            _loc1_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "第四层：受到对手攻击时，抵抗其100bb伤害，且无视对手总战纹80%。" + "<br>";
            _loc1_ += "</textformat>";
         }
         else
         {
            _loc1_ += "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + "第四层：受到对手攻击时，抵抗其100bb伤害，且无视对手总战纹80%。" + "<br>";
            _loc1_ += "</textformat>";
         }
         if(this.currActived)
         {
            _loc1_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "第五层：受到对手攻击时，抵抗其10cc伤害，且无视对手总战纹100%。" + "<br>";
            _loc1_ += "</textformat>";
         }
         else
         {
            _loc1_ += "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + "第五层：受到对手攻击时，抵抗其10cc伤害，且无视对手总战纹100%。" + "<br>";
            _loc1_ += "</textformat>";
         }
         return _loc1_;
      }
      
      private function setInit() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         for each(_loc2_ in ItemPositionRange.POSTION_XIANMOJUEXING_SHENQI)
         {
            if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc2_] != undefined)
            {
               _loc1_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc2_]);
            }
         }
         this.set_ZhongZuJieMian(_loc1_);
      }
      
      public function set_ZhongZuJieMian(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         this.removeItemBoxChildren1();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_XIANMOJUEXING_SHENQI[0])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 220;
               _loc4_.y = 45;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_XIANMOJUEXING_SHENQI[1])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 220;
               _loc4_.y = 45 + 40;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_XIANMOJUEXING_SHENQI[2])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 220;
               _loc4_.y = 45 + 80;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      private function removeItemBoxChildren1() : void
      {
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
      }
      
      public function setGoodsChangeHandler() : void
      {
         this.beibao.text = String(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(47256,true));
      }
      
      private function removeItemBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
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
               PipeManager.sendMsg(PipeConstants.UI_ZHONGZUJIEMIAN_SKILL_DRAG,this.currSkill);
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
   }
}

