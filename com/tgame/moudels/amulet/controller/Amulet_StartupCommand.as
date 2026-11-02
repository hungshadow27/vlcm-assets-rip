package com.tgame.moudels.amulet.controller
{
   import com.tgame.moudels.amulet.model.Amult_MsgReceivedProxy;
   import com.tgame.moudels.amulet.model.Amult_MsgSenderProxy;
   import com.tgame.moudels.amulet.view.AmultAddSheLiZi_Mediator;
   import com.tgame.moudels.amulet.view.Amult_Mediator;
   import com.tgame.moudels.amulet.view.BajiguiyuanhufuDakong_Mediator;
   import com.tgame.moudels.amulet.view.BaoShiDuanLian_Mediator;
   import com.tgame.moudels.amulet.view.DaoJuTiQuKa_Mediator;
   import com.tgame.moudels.amulet.view.RongXueDan_Mediator;
   import com.tgame.moudels.amulet.view.ShenLongAmult_Mediator;
   import com.tgame.moudels.amulet.view.ShenLongHuShenFuDaKong_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Amulet_StartupCommand extends SimpleCommand
   {
      
      public function Amulet_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Amult_MsgReceivedProxy());
         facade.registerProxy(new Amult_MsgSenderProxy());
         facade.registerMediator(new Amult_Mediator());
         facade.registerMediator(new ShenLongAmult_Mediator());
         facade.registerMediator(new AmultAddSheLiZi_Mediator());
         facade.registerMediator(new RongXueDan_Mediator());
         facade.registerMediator(new DaoJuTiQuKa_Mediator());
         facade.registerMediator(new ShenLongHuShenFuDaKong_Mediator());
         facade.registerMediator(new BajiguiyuanhufuDakong_Mediator());
         facade.registerMediator(new BaoShiDuanLian_Mediator());
      }
   }
}

