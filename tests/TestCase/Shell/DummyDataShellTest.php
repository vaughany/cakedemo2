<?php
namespace App\Test\TestCase\Shell;

use App\Shell\DummyDataShell;
use Cake\TestSuite\TestCase;

/**
 * App\Shell\DummyDataShell Test Case
 */
class DummyDataShellTest extends TestCase
{

    /**
     * setUp method
     *
     * @return void
     */
    public function setUp()
    {
        parent::setUp();
        $this->io = $this->getMock('Cake\Console\ConsoleIo');
        $this->DummyData = new DummyDataShell($this->io);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    public function tearDown()
    {
        unset($this->DummyData);

        parent::tearDown();
    }

    /**
     * Test main method
     *
     * @return void
     */
    public function testMain()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
