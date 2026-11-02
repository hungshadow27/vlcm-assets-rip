package com.tgame.shell.view.components.xianmozhilu
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class XianMoZhiLu_DiTuXianZhi extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var imgLeftSpr:Sprite;
      
      private var buttonSpr:MovieClip;
      
      private var imgRightSpr:Sprite;
      
      private var qianghongbao:XianMoWuDaJiPanel;
      
      private var currIndex:int = 1;
      
      private var isThrough:int = 0;
      
      public function XianMoZhiLu_DiTuXianZhi()
      {
         super();
         this.imgLeftSpr = new Sprite();
         this.imgLeftSpr.y = 32;
         addChild(this.imgLeftSpr);
         ToolTips.createToolTips(this.imgLeftSpr,this,function():String
         {
            return getMiaoShuByIndex(currIndex);
         });
         this.buttonSpr = new MovieClip();
         this.buttonSpr.x = 100;
         addChild(this.buttonSpr);
         ToolTips.createToolTips(this.buttonSpr,this,function():String
         {
            var _loc1_:String = null;
            if(getShengJieColorByIndex(currIndex))
            {
               _loc1_ = "";
               _loc1_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + getShengJieNumByIndex(currIndex) + "<br>";
               return _loc1_ + "</textformat>";
            }
            _loc1_ = "";
            _loc1_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + getShengJieNumByIndex(currIndex) + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.imgRightSpr = new Sprite();
         this.imgRightSpr.x = 216;
         this.imgRightSpr.y = 32;
         addChild(this.imgRightSpr);
         ToolTips.createToolTips(this.imgRightSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + getXianWeiByIndex(currIndex) + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      public function setData(param1:Object) : void
      {
         var _loc4_:NewSkinButton = null;
         var _loc5_:DisplayObject = null;
         this.removeContainerBoxChildren();
         this.currIndex = param1.index;
         this.isThrough = param1.isThrough;
         var _loc2_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/" + param1.index + ".swf");
         this.imgLeftSpr.addChild(_loc2_);
         var _loc3_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/xianwei.swf");
         this.imgRightSpr.addChild(_loc3_);
         if(param1.isThrough)
         {
            if(this.buttonSpr.parent)
            {
               this.buttonSpr.parent.removeChild(this.buttonSpr);
            }
            this.buttonSpr = new MovieClip();
            this.buttonSpr.x = 100;
            addChild(this.buttonSpr);
            _loc4_ = new NewSkinButton();
            _loc4_.skin = this.setButtonSkinByIndex(param1.index,param1.isThrough);
         }
         else
         {
            _loc4_ = new NewSkinButton();
            _loc4_.skin = this.setButtonSkinByIndex(param1.index,param1.isThrough);
         }
         this.buttonSpr.addChild(_loc4_);
         _loc4_.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         if(param1.index == 2 && Boolean(param1.isThrough))
         {
            _loc5_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/weikaiqi_2.swf");
            this.buttonSpr.addChild(_loc5_);
         }
      }
      
      private function setButtonSkinByIndex(param1:int, param2:Boolean) : String
      {
         if(param2)
         {
            switch(param1)
            {
               case 1:
                  return "xmzl_into_Button";
               case 2:
               case 13:
                  return "xmzl_tupo_Button";
               case 3:
               case 4:
               case 5:
               case 6:
               case 7:
               case 8:
               case 9:
               case 10:
               case 11:
                  return "xmzl_open_Button";
               case 12:
                  return "xmzl_duihuan_Button";
            }
         }
         else
         {
            switch(param1)
            {
               case 1:
               case 2:
               case 3:
               case 4:
               case 5:
               case 6:
               case 7:
               case 8:
               case 9:
               case 10:
               case 11:
               case 13:
                  return "xmzl_tupo_Button";
               case 12:
                  return "xmzl_duihuan_Button";
            }
         }
         return "";
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(this.currIndex)
         {
            case 1:
               if(this.isThrough)
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_INTO_MAP_CLICK));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
               break;
            case 2:
               if(!this.isThrough)
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
               break;
            case 3:
               if(this.isThrough)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_AOJIANZHUANSHENG);
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
               break;
            case 4:
               if(this.isThrough)
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_OPEN_ZHUANGBEI_CLICK));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
               break;
            case 5:
               if(this.isThrough)
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_OPEN_ZHUANZHI_CLICK));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
               break;
            case 6:
               if(this.isThrough)
               {
                  PipeManager.sendMsg(PipeConstants.GET_ZHONGZU_PANEL,2);
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
               break;
            case 7:
               if(this.isThrough)
               {
                  PipeManager.sendMsg(PipeConstants.GET_ZHONGZU_PANEL,3);
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
               break;
            case 8:
               if(this.isThrough)
               {
                  PipeManager.sendMsg(PipeConstants.GET_AOJIANFEISHENG_PANEL);
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
               break;
            case 9:
               if(this.isThrough)
               {
                  PipeManager.sendMsg(PipeConstants.GET_XIANMOWUDAJI);
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
               break;
            case 10:
               if(this.isThrough)
               {
                  PipeManager.sendMsg(PipeConstants.GET_ZHONGZU_PANEL,4);
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
               break;
            case 11:
               if(this.isThrough)
               {
                  PipeManager.sendMsg(PipeConstants.GET_ZHONGZU_PANEL,5);
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
               break;
            case 12:
               this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               break;
            case 13:
               if(!this.isThrough)
               {
                  this.$parent.dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_TUPO_CLICK,"",this.currIndex));
               }
         }
      }
      
      private function getGoodsNumByGoodsID(param1:int) : int
      {
         return GameInstance.mainCharData.goodsInfo.getGoodsNumByID(param1,true);
      }
      
      private function getMiaoShuByIndex(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "地图限制：玩家突破本层仙位将开启傲剑全新天宫地图“天宫道”，" + "<br>" + "全新地图将为大家带来全新的玩法和全新的挑战。" + "<br>";
               _loc2_ += "</textformat>";
               break;
            case 2:
               _loc2_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "等级上限：玩家突破本层仙位将开启傲剑全新等级限制（满级500级）。" + "<br>";
               _loc2_ += "</textformat>";
               _loc2_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + "200级之后，每提升5级，将额外增加500000亿基础攻击。" + "<br>";
               _loc2_ += "</textformat>";
               break;
            case 3:
               _loc2_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "傲剑转升：玩家突破本层将开启傲剑全新系统转升系统。" + "<br>";
               _loc2_ += "</textformat>";
               break;
            case 4:
               _loc2_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "玩家突破本层后将可以将200级装备升级至300级。" + "<br>" + "玩家突破本层后，突破按钮变成“升级按钮”。" + "<br>";
               _loc2_ += "</textformat>";
               break;
            case 5:
               _loc2_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "仙魔转职：突破现有职业限制晋升全新仙魔模式。" + "<br>";
               _loc2_ += "</textformat>";
               break;
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
               _loc2_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "无" + "<br>";
               _loc2_ += "</textformat>";
         }
         return _loc2_;
      }
      
      private function getShengJieColorByIndex(param1:int) : Boolean
      {
         var _loc2_:Boolean = true;
         var _loc3_:int = this.getGoodsNumByGoodsID(47246);
         switch(param1)
         {
            case 1:
               _loc2_ = _loc3_ >= 1 ? true : false;
               break;
            case 2:
               _loc2_ = _loc3_ >= 5 ? true : false;
               break;
            case 3:
               _loc2_ = _loc3_ >= 8 ? true : false;
               break;
            case 4:
               _loc2_ = _loc3_ >= 10 ? true : false;
               break;
            case 5:
               _loc2_ = _loc3_ >= 20 ? true : false;
         }
         return _loc2_;
      }
      
      private function getShengJieNumByIndex(param1:int) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = this.getGoodsNumByGoodsID(47246);
         switch(param1)
         {
            case 1:
               _loc2_ = "突破条件：神魔石*1";
               break;
            case 2:
               _loc2_ = "突破条件：神魔石*5";
               break;
            case 3:
               _loc2_ = "突破条件：神魔石*8";
               break;
            case 4:
               _loc2_ = "突破条件：神魔石*10";
               break;
            case 5:
               _loc2_ = "突破条件：神魔石*20";
               break;
            case 6:
               _loc2_ = "突破条件：觉醒图鉴*1";
               break;
            case 7:
               _loc2_ = "突破条件：天技激活书*1";
               break;
            case 8:
               _loc2_ = "突破条件：飞升突破精元*1";
               break;
            case 9:
               _loc2_ = "突破条件：神魔石*20";
               break;
            case 10:
               _loc2_ = "突破条件：天纹激活书*1";
               break;
            case 11:
               _loc2_ = "突破条件：天瑞激活书*1";
         }
         return _loc2_;
      }
      
      private function getXianWeiByIndex(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = "傲帝";
               break;
            case 2:
               _loc2_ = "傲皇";
               break;
            case 3:
               _loc2_ = "傲仙";
               break;
            case 4:
               _loc2_ = "傲尊";
               break;
            case 5:
               _loc2_ = "傲神";
               break;
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
               _loc2_ = "无";
         }
         return _loc2_;
      }
      
      private function removeContainerBoxChildren() : void
      {
         while(this.imgLeftSpr.numChildren > 0)
         {
            this.imgLeftSpr.removeChildAt(0);
         }
         while(this.buttonSpr.numChildren > 0)
         {
            this.buttonSpr.removeChildAt(0);
         }
         while(this.imgRightSpr.numChildren > 0)
         {
            this.imgRightSpr.removeChildAt(0);
         }
      }
   }
}

