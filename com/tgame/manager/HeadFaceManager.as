package com.tgame.manager
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.monster.MonsterRes;
   import com.tgame.common.staticdata.ColorConst;
   import com.tgame.common.staticdata.MonsterType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.Player;
   import com.tgame.moudels.login.view.*;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class HeadFaceManager
   {
      
      public function HeadFaceManager()
      {
         super();
      }
      
      public static function updatePlayersName(param1:Array, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc4_:SceneCharacter = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:uint = 0;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:Player = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc5_ in param1)
         {
            _loc4_ = GameInstance.scene.getCharByID(_loc5_,SceneCharacterType.PLAYER);
            if(!(_loc4_ == null || !_loc4_.usable))
            {
               _loc11_ = _loc4_.data as Player;
               if(ReloginManager.isInKuafu)
               {
                  if(param2)
                  {
                     _loc8_ = _loc11_.attributeInfo.isGM ? "【GM】" : "";
                     _loc9_ = "";
                     _loc10_ = _loc11_.isInProtect ? LanResManager.getLanCommonTextWords("[和平保护中]") : "";
                     _loc10_ = _loc10_ + (_loc11_.isInKanqi ? LanResManager.getLanCommonTextWords("[砍旗非保护中]") : "");
                     _loc10_ = _loc10_ + (_loc11_.isInHuqi ? LanResManager.getLanCommonTextWords("[护旗非保护中]") : "");
                     _loc10_ = _loc10_ + (_loc11_.isShouhu ? LanResManager.getLanCommonTextWords("[守护]") : "");
                     _loc6_ = _loc8_ + _loc4_.name.replace("$3[$1$2]",/^\[(\d+)(.*)\](.+)$/) + _loc9_ + _loc10_;
                  }
                  else
                  {
                     _loc6_ = _loc4_.getHeadFaceNickName();
                  }
                  if(param3)
                  {
                     if(GameInstance.scene.mapConfig != null)
                     {
                        if(GameInstance.scene.mapConfig.mapID == OtherConst.KUAFULUNJIANTAI_MAP_ID)
                        {
                           if(_loc4_.isMainChar())
                           {
                              _loc7_ = ColorConst.MAINCHAR_NICK_NAME_COLOR;
                           }
                           else if(_loc4_ == GameInstance.lockOnChar)
                           {
                              _loc7_ = ColorConst.PLAYER_SELECT_NICK_NAME_COLOR;
                           }
                           else if(_loc11_.banghuiInfo.banghuiId != 0 && GameConfig.xuanyuanjian_banghuiIDList.indexOf(_loc11_.banghuiInfo.banghuiId) != -1)
                           {
                              _loc7_ = ColorConst.LJT_CHIJIAN_COLOR;
                           }
                           else
                           {
                              _loc7_ = ColorConst.LJT_WEICHIJIAN_COLOR;
                           }
                        }
                        else if(GameInstance.scene.mapConfig.mapID == OtherConst.VS3V3_QIANGQI_MAP_ID || GameInstance.scene.mapConfig.mapID == OtherConst.VS3V3_PK_MAP_ID)
                        {
                           if(_loc4_.isMainChar())
                           {
                              if(GameInstance.mainCharData.attributeInfo.vs3V3Team == 1)
                              {
                                 _loc7_ = ColorConst.VS3V3_HUANG_COLOR;
                              }
                              else
                              {
                                 _loc7_ = ColorConst.VS3V3_LAN_COLOR;
                              }
                           }
                           else if(_loc4_ == GameInstance.lockOnChar)
                           {
                              _loc7_ = ColorConst.PLAYER_SELECT_NICK_NAME_COLOR;
                           }
                           else if(GameInstance.mainCharData.teamInfo.getPlayerByID(_loc4_.id) != null)
                           {
                              if(GameInstance.mainCharData.attributeInfo.vs3V3Team == 1)
                              {
                                 _loc7_ = ColorConst.VS3V3_HUANG_COLOR;
                              }
                              else
                              {
                                 _loc7_ = ColorConst.VS3V3_LAN_COLOR;
                              }
                           }
                           else if(GameInstance.mainCharData.attributeInfo.vs3V3Team == 1)
                           {
                              _loc7_ = ColorConst.VS3V3_LAN_COLOR;
                           }
                           else
                           {
                              _loc7_ = ColorConst.VS3V3_HUANG_COLOR;
                           }
                        }
                        else if(GameInstance.scene.mapConfig.mapID == OtherConst.FUQIJINGJICHANG_MAP_ID)
                        {
                           if(_loc4_.isMainChar())
                           {
                              if(GameInstance.mainCharData.attributeInfo.vs3V3Team == 1)
                              {
                                 _loc7_ = ColorConst.VS3V3_HUANG_COLOR;
                              }
                              else
                              {
                                 _loc7_ = ColorConst.VS3V3_LAN_COLOR;
                              }
                           }
                           else
                           {
                              if(_loc4_ == GameInstance.lockOnChar)
                              {
                                 _loc7_ = ColorConst.PLAYER_SELECT_NICK_NAME_COLOR;
                              }
                              else if(GameInstance.mainCharData.teamInfo.getPlayerByID(_loc4_.id) != null)
                              {
                                 if(GameInstance.mainCharData.attributeInfo.vs3V3Team == 1)
                                 {
                                    _loc7_ = ColorConst.VS3V3_HUANG_COLOR;
                                 }
                                 else
                                 {
                                    _loc7_ = ColorConst.VS3V3_LAN_COLOR;
                                 }
                              }
                              else if(GameInstance.mainCharData.attributeInfo.vs3V3Team == 1)
                              {
                                 _loc7_ = ColorConst.VS3V3_LAN_COLOR;
                              }
                              else
                              {
                                 _loc7_ = ColorConst.VS3V3_HUANG_COLOR;
                              }
                              if(GameInstance.mainCharData.teamInfo.getPlayerByID(_loc4_.id) == null)
                              {
                                 _loc6_ = _loc8_ + LanResManager.getLanCommonTextWords("敌方");
                              }
                           }
                        }
                        else if(GameInstance.scene.mapConfig.mapID == OtherConst.TUNSHITIANDI_MAP_ID)
                        {
                           if(_loc4_.isMainChar())
                           {
                              _loc7_ = ColorConst.MAINCHAR_NICK_NAME_COLOR;
                           }
                           else if(GameInstance.mainCharData.teamInfo.getPlayerByID(_loc4_.id) != null)
                           {
                              _loc7_ = ColorConst.PLAYER_TEAM_NICK_NAME_COLOR;
                           }
                           else
                           {
                              _loc7_ = ColorConst.NAMECOLOR_RED_COLOR;
                           }
                        }
                        else
                        {
                           _loc7_ = _loc4_.getHeadFaceNickNameColor();
                        }
                     }
                     else
                     {
                        _loc7_ = _loc4_.getHeadFaceNickNameColor();
                     }
                  }
                  else
                  {
                     _loc7_ = _loc4_.getHeadFaceNickNameColor();
                     _loc7_ = ColorConst.PLAYER_SELECT_NICK_NAME_COLOR;
                  }
                  _loc4_.setHeadFaceNickName(_loc6_,_loc7_);
               }
               else
               {
                  if(param2)
                  {
                     _loc8_ = _loc11_.attributeInfo.isGM ? "【GM】" : "";
                     if(_loc5_ != 0 && _loc5_ == GameConfig.xiangyangcheng_bangzhuID)
                     {
                        _loc9_ = LanResManager.getLanCommonTextWords("[襄阳城主]");
                     }
                     else if(_loc11_.banghuiInfo.banghuiId != 0 && _loc11_.banghuiInfo.banghuiId == GameConfig.xiangyangcheng_banghuiID)
                     {
                        _loc9_ = LanResManager.getLanCommonTextWords("[襄阳城]");
                     }
                     else
                     {
                        _loc9_ = "";
                     }
                     _loc10_ = _loc11_.isInProtect ? LanResManager.getLanCommonTextWords("[和平保护中]") : "";
                     _loc10_ = _loc10_ + (_loc11_.isInKanqi ? LanResManager.getLanCommonTextWords("[砍旗非保护中]") : "");
                     _loc10_ = _loc10_ + (_loc11_.isInHuqi ? LanResManager.getLanCommonTextWords("[护旗非保护中]") : "");
                     _loc10_ = _loc10_ + (_loc11_.isShouhu ? LanResManager.getLanCommonTextWords("[守护]") : "");
                     _loc6_ = _loc8_ + _loc4_.name.replace("$3[$1$2]",/^\[(\d+)(.*)\](.+)$/) + _loc9_ + _loc10_;
                  }
                  else
                  {
                     _loc6_ = _loc4_.getHeadFaceNickName();
                  }
                  if(param3)
                  {
                     if(ReloginManager.isInGongcheng)
                     {
                        if(_loc4_.isMainChar())
                        {
                           _loc7_ = ColorConst.MAINCHAR_NICK_NAME_COLOR;
                        }
                        else if(_loc4_ == GameInstance.lockOnChar)
                        {
                           _loc7_ = ColorConst.PLAYER_SELECT_NICK_NAME_COLOR;
                        }
                        else if(_loc11_.banghuiInfo.banghuiId != 0 && _loc11_.banghuiInfo.banghuiId == GameConfig.xiangyangcheng_banghuiID)
                        {
                           _loc7_ = ColorConst.CLT_SHOU_COLOR;
                        }
                        else if(GameConfig.gongcheng_banghuiID_arr.indexOf(_loc11_.banghuiInfo.banghuiId) != -1 || _loc11_.banghuiInfo.banghuiId == GameConfig.xiangyangcheng_banghuiID)
                        {
                           _loc7_ = ColorConst.CLT_GONG_COLOR;
                        }
                        else
                        {
                           _loc7_ = ColorConst.CLT_ZHONG_COLOR;
                        }
                     }
                     else if(_loc4_.isMainChar())
                     {
                        _loc7_ = ColorConst.MAINCHAR_NICK_NAME_COLOR;
                     }
                     else if(_loc4_ == GameInstance.lockOnChar)
                     {
                        _loc7_ = ColorConst.PLAYER_SELECT_NICK_NAME_COLOR;
                     }
                     else if(GameInstance.mainCharData.teamInfo.getPlayerByID(_loc5_) != null)
                     {
                        _loc7_ = ColorConst.PLAYER_TEAM_NICK_NAME_COLOR;
                     }
                     else if(GameInstance.mainCharData.banghuiInfo.isTongbang(_loc11_.banghuiInfo.banghuiId))
                     {
                        _loc7_ = ColorConst.PLAYER_PARTY_NICK_NAME_COLOR;
                     }
                     else
                     {
                        _loc7_ = ColorConst.PLAYER_NICK_NAME_COLOR;
                     }
                  }
                  else
                  {
                     _loc7_ = _loc4_.getHeadFaceNickNameColor();
                  }
                  if(_loc11_.avatarInfo.isCiKe)
                  {
                     _loc6_ = _loc8_ + LanResManager.getLanCommonTextWords("刺客");
                  }
                  _loc4_.setHeadFaceNickName(_loc6_,_loc7_);
               }
            }
         }
      }
      
      public static function updateCharCustomHtmlText(param1:int) : void
      {
         var _loc2_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.PLAYER);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Player = _loc2_.data as Player;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:String = "";
         var _loc5_:String = _loc3_.achieveInfo.getCurrentTitle();
         if(_loc5_ != "")
         {
            _loc4_ = "<font color=\'" + ColorConst.tran16ToStr(ColorConst.PLAYER_TITLE_COLOR) + "\'>" + _loc5_ + "</font>";
         }
         var _loc6_:String = _loc3_.banghuiInfo.banghuiName;
         if(_loc6_ != "" && _loc6_ != null)
         {
            if(_loc4_ != "")
            {
               _loc4_ += "<br />";
            }
            _loc4_ += "<font color=\'" + ColorConst.tran16ToStr(ColorConst.PLAYER_BANGHUI_COLOR) + "\'>" + LanResManager.getLanCommonTextWords("[帮会]") + _loc6_.replace(/^\[(\d+)(.*)\](.+)$/,"$3[$1$2]") + "</font>";
         }
         _loc2_.setHeadFaceCustomTitleHtmlText(_loc4_);
      }
      
      public static function updateMonstersNameColor(param1:Array) : void
      {
         var _loc2_:SceneCharacter = null;
         var _loc4_:Monster = null;
         var _loc5_:MonsterRes = null;
         var _loc6_:uint = 0;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:Array = param1;
         for each(_loc2_ in _loc3_)
         {
            _loc4_ = _loc2_.data as Monster;
            _loc5_ = _loc4_.res;
            if(_loc5_.type != MonsterType.BANGQI)
            {
               _loc6_ = getMonsterNameColor(_loc4_.attributeInfo.lv);
               _loc2_.setHeadFaceNickName(_loc2_.getHeadFaceNickName(),_loc6_);
            }
         }
      }
      
      public static function getMonsterNameColor(param1:int) : uint
      {
         var _loc2_:uint = 0;
         var _loc3_:int = param1 - GameInstance.mainCharData.attributeInfo.lv;
         if(-10 >= _loc3_)
         {
            _loc2_ = ColorConst.MONSTER_NICK_NAME_LOW_COLOR2;
         }
         else if(-5 > _loc3_ && _loc3_ > -10)
         {
            _loc2_ = ColorConst.MONSTER_NICK_NAME_LOW_COLOR;
         }
         else if(5 >= _loc3_ && _loc3_ >= -5)
         {
            _loc2_ = ColorConst.MONSTER_NICK_NAME_COLOR;
         }
         else if(10 > _loc3_ && _loc3_ > 5)
         {
            _loc2_ = ColorConst.MONSTER_NICK_NAME_HIGH_COLOR;
         }
         else
         {
            _loc2_ = ColorConst.MONSTER_NICK_NAME_HIGH_COLOR2;
         }
         return _loc2_;
      }
      
      public static function updateCharSkillLevel(param1:int, param2:Number, param3:int = 1) : void
      {
         var _loc10_:BitmapData = null;
         var _loc11_:BitmapData = null;
         var _loc12_:BitmapData = null;
         var _loc13_:BitmapData = null;
         var _loc14_:BitmapData = null;
         var _loc15_:int = 0;
         var _loc16_:BitmapData = null;
         var _loc17_:BitmapData = null;
         var _loc18_:BitmapData = null;
         var _loc19_:BitmapData = null;
         var _loc20_:BitmapData = null;
         var _loc21_:BitmapData = null;
         var _loc22_:BitmapData = null;
         var _loc23_:Number = NaN;
         var _loc24_:int = 0;
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(param1,param3);
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:Player = _loc4_.data as Player;
         if(!_loc5_)
         {
            return;
         }
         if(_loc5_.avatarInfo.isCiKe)
         {
            return;
         }
         _loc5_.skillInfo.skillLevel = param2;
         var _loc6_:BitmapData = new BitmapData(102,46,true,0);
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:int = _loc5_.skillInfo.getSkillLevelID();
         if(_loc5_.attributeInfo.zhenyingID != 0)
         {
            _loc10_ = RslLoaderManager.getInstance("ui.mengsongZhenying." + _loc5_.attributeInfo.zhenyingID,30,30);
            if(_loc10_ != null)
            {
               _loc6_.copyPixels(_loc10_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               _loc7_ = true;
            }
         }
         else if(_loc5_.attributeInfo.pingtaiID != -1)
         {
            _loc11_ = RslLoaderManager.getInstance("ui.pingtai.id." + _loc5_.attributeInfo.pingtaiID,30,30);
            if(_loc11_ != null)
            {
               _loc6_.copyPixels(_loc11_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               _loc7_ = true;
            }
         }
         else if(_loc5_.attributeInfo.isYuanJianLingPo)
         {
            _loc12_ = RslLoaderManager.getInstance("ui.yuanjianlingpo.id",30,30);
            if(_loc12_ != null)
            {
               _loc6_.copyPixels(_loc12_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               _loc7_ = true;
            }
         }
         else if(_loc5_.attributeInfo.isDaoGuXianFengXunZhang)
         {
            _loc12_ = RslLoaderManager.getInstance("ui.xunZhangJingJie.id.dao",30,30);
            if(_loc12_ != null)
            {
               _loc6_.copyPixels(_loc12_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               _loc7_ = true;
            }
         }
         else if(_loc5_.attributeInfo.skillLvStatus > 0)
         {
            _loc10_ = RslLoaderManager.getInstance("ui.ico.skill." + _loc5_.attributeInfo.skillLvStatus,30,30);
            if(_loc10_ != null)
            {
               _loc6_.copyPixels(_loc10_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               _loc7_ = true;
            }
         }
         else if(_loc5_.attributeInfo.isJiDaoQianKunXunZhang)
         {
            _loc13_ = RslLoaderManager.getInstance("ui.xunZhangJingJie.id.ji",30,30);
            if(_loc13_ != null)
            {
               _loc6_.copyPixels(_loc13_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               _loc7_ = true;
            }
         }
         else if(_loc5_.attributeInfo.isTianmingXunzhang)
         {
            _loc14_ = RslLoaderManager.getInstance("ui.tianmingshengzun",30,30);
            if(_loc14_ != null)
            {
               _loc6_.copyPixels(_loc14_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               _loc7_ = true;
            }
         }
         else if(_loc5_.attributeInfo.xunZhangJingJie != -1)
         {
            _loc15_ = 0;
            if(_loc5_.attributeInfo.xunZhangJingJie < 50)
            {
               _loc15_ = 0;
            }
            else if(_loc5_.attributeInfo.xunZhangJingJie < 100)
            {
               _loc15_ = 50;
            }
            else if(_loc5_.attributeInfo.xunZhangJingJie < 200)
            {
               _loc15_ = 100;
            }
            else if(_loc5_.attributeInfo.xunZhangJingJie < 500)
            {
               _loc15_ = 200;
            }
            else
            {
               _loc15_ = 500;
            }
            _loc16_ = RslLoaderManager.getInstance("ui.xunZhangJingJie.id." + _loc15_,30,30);
            if(_loc16_ != null)
            {
               _loc6_.copyPixels(_loc16_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               _loc7_ = true;
            }
         }
         else if(_loc9_ >= 1 && _loc9_ <= 7)
         {
            _loc17_ = RslLoaderManager.getInstance("ui.jingjie.j" + _loc9_,30,30);
            if(_loc17_ != null)
            {
               _loc6_.copyPixels(_loc17_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               _loc7_ = true;
            }
         }
         if(_loc5_.attributeInfo.isXuanJianLingPo)
         {
            _loc18_ = RslLoaderManager.getInstance("ui.xuanjianlingpo.id",30,30);
            if(_loc18_ != null)
            {
               if(_loc7_)
               {
                  _loc6_.copyPixels(_loc18_,new Rectangle(0,0,30,30),new Point(42,6),null,null,true);
               }
               else
               {
                  _loc6_.copyPixels(_loc18_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               }
               _loc8_ = true;
            }
         }
         else if(_loc5_.attributeInfo.isTianDiRenHe)
         {
            _loc18_ = RslLoaderManager.getInstance("ui.tiandirenhe.id",30,30);
            if(_loc18_ != null)
            {
               if(_loc7_)
               {
                  _loc6_.copyPixels(_loc18_,new Rectangle(0,0,30,30),new Point(42,6),null,null,true);
               }
               else
               {
                  _loc6_.copyPixels(_loc18_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               }
               _loc8_ = true;
            }
         }
         else if(_loc5_.attributeInfo.isWuGenXianZhou)
         {
            _loc19_ = RslLoaderManager.getInstance("ui.shengsi.wu",30,30);
            if(_loc19_ != null)
            {
               if(_loc7_)
               {
                  _loc6_.copyPixels(_loc19_,new Rectangle(0,0,30,30),new Point(42,6),null,null,true);
               }
               else
               {
                  _loc6_.copyPixels(_loc19_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               }
               _loc8_ = true;
            }
         }
         else if(_loc5_.attributeInfo.isLongwenFuzhou)
         {
            _loc20_ = RslLoaderManager.getInstance("ui.longwenfuzhou",30,30);
            if(_loc20_ != null)
            {
               if(_loc7_)
               {
                  _loc6_.copyPixels(_loc20_,new Rectangle(0,0,30,30),new Point(42,6),null,null,true);
               }
               else
               {
                  _loc6_.copyPixels(_loc20_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               }
            }
            _loc8_ = true;
         }
         else if(_loc5_.attributeInfo.shengsifu != -1)
         {
            _loc21_ = RslLoaderManager.getInstance("ui.shengsi." + _loc5_.attributeInfo.shengsifu,30,30);
            if(_loc21_ != null)
            {
               if(_loc7_)
               {
                  _loc6_.copyPixels(_loc21_,new Rectangle(0,0,30,30),new Point(42,6),null,null,true);
               }
               else
               {
                  _loc6_.copyPixels(_loc21_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               }
            }
            _loc8_ = true;
         }
         else if(_loc5_.attributeInfo.YNchengfaStatus != -1)
         {
            _loc22_ = RslLoaderManager.getInstance("ui.yn.chengfa.ico",30,30);
            if(_loc22_ != null)
            {
               if(_loc7_)
               {
                  _loc6_.copyPixels(_loc22_,new Rectangle(0,0,30,30),new Point(42,6),null,null,true);
               }
               else
               {
                  _loc6_.copyPixels(_loc22_,new Rectangle(0,0,30,30),new Point(72,6),null,null,true);
               }
               _loc8_ = true;
            }
         }
         if(_loc5_.attributeInfo.wufang >= 50000)
         {
            _loc23_ = _loc5_.attributeInfo.wufang;
            _loc24_ = 0;
            if(_loc23_ >= 20000000000)
            {
               _loc24_ = 10;
            }
            else if(_loc23_ >= 16000000000)
            {
               _loc24_ = 9;
            }
            else if(_loc23_ >= 14000000000)
            {
               _loc24_ = 8;
            }
            else if(_loc23_ >= 12000000000)
            {
               _loc24_ = 7;
            }
            else if(_loc23_ >= 10000000000)
            {
               _loc24_ = 6;
            }
            else if(_loc23_ >= 8000000000)
            {
               _loc24_ = 5;
            }
            else if(_loc23_ >= 6000000000)
            {
               _loc24_ = 4;
            }
            else if(_loc23_ >= 4000000000)
            {
               _loc24_ = 3;
            }
            else if(_loc23_ >= 2000000000)
            {
               _loc24_ = 2;
            }
            else if(_loc23_ >= 500000000)
            {
               _loc24_ = 1;
            }
            else
            {
               _loc24_ = 0;
            }
            _loc18_ = RslLoaderManager.getInstance("ui.wufang.right." + _loc24_,42,46);
            if(_loc18_ != null)
            {
               if(_loc7_ && _loc8_)
               {
                  _loc6_.copyPixels(_loc18_,new Rectangle(0,0,42,46),new Point(0,0),null,null,true);
               }
               else if(_loc7_ || _loc8_)
               {
                  _loc6_.copyPixels(_loc18_,new Rectangle(0,0,42,46),new Point(30,0),null,null,true);
               }
               else
               {
                  _loc6_.copyPixels(_loc18_,new Rectangle(0,0,42,46),new Point(60,0),null,null,true);
               }
            }
         }
         _loc4_.setHeadFaceLeftIco(new Bitmap(_loc6_));
      }
      
      public static function updateCharPaihang(param1:int, param2:Array, param3:int = 1, param4:Boolean = false, param5:String = "") : void
      {
         var phNum:int;
         var hasNanOrNvShen:Boolean;
         var lo:Function;
         var setCentre:Function;
         var char:SceneCharacter = null;
         var topIco:Sprite = null;
         var chourenBo:Boolean = false;
         var CentreIcoDis:Vector.<DisplayObject> = null;
         var xunhuanPaihangbangArr:Array = null;
         var space:Number = NaN;
         var ico:Bitmap = null;
         var icoBD:BitmapData = null;
         var phId:int = 0;
         var i:int = 0;
         var imgSprArr:Array = null;
         var zhen:int = 0;
         var sl:int = 0;
         var j:int = 0;
         var ab:Array = null;
         var sp:DisplayObject = null;
         var $playerID:int = param1;
         var phIDArr:Array = param2;
         var $type:int = param3;
         var $isSpecialChenghao:Boolean = param4;
         var $xunhuanPaiangbang:String = param5;
         char = GameInstance.scene.getCharByID($playerID,$type);
         if(!char)
         {
            return;
         }
         phNum = int(phIDArr.length);
         hasNanOrNvShen = false;
         chourenBo = false;
         if(phNum > 0)
         {
            space = 2;
            topIco = new Sprite();
            i = 0;
            while(i < phNum)
            {
               phId = int(phIDArr[i]);
               if(phId == 32 || phId == 33)
               {
                  icoBD = RslLoaderManager.getInstance("ui.paihang.ph" + phId,150,26);
                  hasNanOrNvShen = true;
                  if(icoBD != null)
                  {
                     ico = new Bitmap(icoBD);
                     ico.y = topIco.height > 0 ? topIco.height + space : 0;
                     topIco.addChild(ico);
                  }
                  break;
               }
               i++;
            }
            if(!hasNanOrNvShen)
            {
               i = 0;
               while(i < phNum)
               {
                  phId = int(phIDArr[i]);
                  if($isSpecialChenghao)
                  {
                     icoBD = RslLoaderManager.getInstance("ui.guanjun." + phId,150,26);
                  }
                  else
                  {
                     icoBD = RslLoaderManager.getInstance("ui.paihang.ph" + phId,150,26);
                  }
                  if(icoBD != null)
                  {
                     ico = new Bitmap(icoBD);
                     ico.y = topIco.height > 0 ? topIco.height + space : 0;
                     topIco.addChild(ico);
                  }
                  i++;
               }
            }
         }
         char.setHeadFaceTopIco(topIco);
         xunhuanPaihangbangArr = new Array();
         if($xunhuanPaiangbang != "")
         {
            xunhuanPaihangbangArr.push($xunhuanPaiangbang);
         }
         if(xunhuanPaihangbangArr.length > 0)
         {
            lo = function(param1:DisplayObject, param2:int):void
            {
               ++sl;
               if(sl == zhen * xunhuanPaihangbangArr.length)
               {
                  setCentre();
               }
            };
            setCentre = function():void
            {
               var _loc1_:int = 0;
               var _loc2_:Sprite = null;
               var _loc3_:int = 0;
               if(sl == zhen * xunhuanPaihangbangArr.length)
               {
                  CentreIcoDis = new Vector.<DisplayObject>();
                  if(imgSprArr.length > 0)
                  {
                     _loc1_ = 0;
                     while(_loc1_ < imgSprArr[0].length)
                     {
                        _loc2_ = new Sprite();
                        _loc3_ = 0;
                        while(_loc3_ < imgSprArr.length)
                        {
                           imgSprArr[_loc3_][_loc1_].y = _loc2_.height;
                           _loc2_.addChild(imgSprArr[_loc3_][_loc1_]);
                           _loc3_++;
                        }
                        CentreIcoDis.push(_loc2_);
                        _loc1_++;
                     }
                     if(chourenBo)
                     {
                        char.setHeadFaceCentreIco(null);
                     }
                     else
                     {
                        char.setHeadFaceCentreIco(CentreIcoDis);
                     }
                  }
               }
            };
            imgSprArr = new Array();
            zhen = 8;
            sl = 0;
            j = 0;
            while(j < xunhuanPaihangbangArr.length)
            {
               ab = new Array();
               i = 1;
               while(i <= zhen)
               {
                  sp = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/paihangbang/" + xunhuanPaihangbangArr[j] + "/" + xunhuanPaihangbangArr[j] + "_" + i + ".swf",lo,i);
                  ab.push(sp);
                  i++;
               }
               imgSprArr.push(ab);
               j++;
            }
            setCentre();
         }
         else
         {
            char.setHeadFaceCentreIco(null);
         }
      }
      
      public static function updateCharChenwei(param1:int, param2:int, param3:int = 1) : void
      {
         var _loc6_:BitmapData = null;
         var _loc7_:Bitmap = null;
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(param1,param3);
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:Player = _loc4_.data as Player;
         if(!_loc5_)
         {
            return;
         }
         if(_loc5_.avatarInfo.isCiKe)
         {
            return;
         }
         if(param2 > 0)
         {
            _loc6_ = RslLoaderManager.getInstance("ui.fenghao." + param2,30,30);
            if(_loc6_ != null)
            {
               _loc7_ = new Bitmap(_loc6_);
               _loc4_.setHeadFaceRightIco(_loc7_);
               return;
            }
         }
         else
         {
            _loc4_.setHeadFaceRightIco(null);
         }
      }
   }
}

