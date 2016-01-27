<?php
namespace App\Shell;

use Cake\Console\Shell;

/**
 * DummyData shell command.
 */
class DummyDataShell extends Shell
{

    /**
     * main() method.
     *
     * @return bool|int Success or error code.
     */
    public function main()
    {
        $this->out("Creating user populator");
        $faker = \Faker\Factory::create();
        $faker->addProvider(new \Faker\Provider\Internet($faker));

        $entityPopulator = new \Faker\ORM\CakePHP\EntityPopulator('Users');
        $populator = new \Faker\ORM\CakePHP\Populator($faker);
        $populator->addEntity($entityPopulator, 20, [
          'email' => function () use ($faker) { return $faker->email(); },
          'password' => 'password',
        ]);

        $this->out("Inserting");
        $populator->execute(['validate' => false]);
    }
}
