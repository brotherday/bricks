import React from 'react'
import { Card, CardBody, CardFooter, Image, Stack, Heading, Text, Divider, Button, ButtonGroup, CardHeader, SimpleGrid } from '@chakra-ui/react'
const home = () => {
    return (
        <div>
            <div className="flex items-center flex-col flex-grow pt-10">
                <div className="px-5">
                    <h1 className="text-center mb-8">
                        <span className="block text-2xl mb-2">Welcome to Bricks</span>
                        <span className="block text-4xl font-bold">The protocol to combine, fractionalize, and trade NFTs.</span>
                    </h1>
                    <p className="text-center text-lg">
                        Transform your NFT collection into a tradable asset with guaranteed liquidity
                    </p>
                </div>

                <div className="flex-grow bg-base-300 w-full mt-16 px-8 py-12">
                    <div className="flex justify-center items-center gap-20 flex-col sm:flex-row">
                        <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
                            <p>
                                Buy and sell fractions of NFTs
                            </p>
                            {/* <div>Explore Live Vaults</div> */}
                            <div className='mt-4 px-4 py-3 bg-base-300 rounded-xl'><Button colorScheme="blue">Explore</Button></div>
                        </div>
                        <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
                            <Card maxW='sm'>
                                <CardBody>
                                    <Image
                                        src='https://nftnow.com/wp-content/uploads/2022/04/Fractional-Doodle-Pickle.png'
                                        alt='Bored Ape'
                                        borderRadius='lg'
                                    />
                                    <Stack mt='6' spacing='3'>
                                        <Heading size='md'>Doodle Pickle</Heading>
                                        <Text>
                                            Doodle Pickle Yatch Club.
                                        </Text>
                                        <Text color='blue.600' fontSize='2xl'>
                                            $450
                                        </Text>
                                    </Stack>
                                </CardBody>
                            </Card>
                        </div>
                    </div>
                </div>
                <div className="px-5">
                    <h1 className="text-center mb-8">
                        <span className="block text-2xl pt-5 mb-2">Key Features</span>
                    </h1>
                    <p className="text-center text-lg mb-4">
                        Built by NFT collectors, Bricks brings a revolutionary and unique way to combine your NFT collection, tokenize it and make it tradable.
                    </p>
                    <div className="bg-base-300 p-5 rounded-xl items-center justify-center">
                        <SimpleGrid spacing={4} templateColumns='repeat(auto-fill, minmax(200px, 1fr))'>
                            <Card>
                            <CardHeader>
                                <Heading size='md'> Vault - 1</Heading>
                            </CardHeader>
                            <CardBody>
                                <Text>Some detail about the vault.</Text>
                            </CardBody>
                            <CardFooter>
                                <Button colorScheme="blue">View here</Button>
                            </CardFooter>
                        </Card>
                            <Card>
                                <CardHeader>
                                    <Heading size='md'> Vault - 2</Heading>
                                </CardHeader>
                                <CardBody>
                                    <Text>Some detail about the vault.</Text>
                                </CardBody>
                                <CardFooter>
                                    <Button colorScheme="blue">View here</Button>
                                </CardFooter>
                            </Card>
                            <Card>
                                <CardHeader>
                                    <Heading size='md'> Vault - 3</Heading>
                                </CardHeader>
                                <CardBody>
                                    <Text>Some detail about the vault.</Text>
                                </CardBody>
                                <CardFooter>
                                    <Button colorScheme="blue">View here</Button>
                                </CardFooter>
                            </Card>
                            <Card>
                                <CardHeader>
                                    <Heading size='md'> Vault - 4</Heading>
                                </CardHeader>
                                <CardBody>
                                    <Text>Some detail about the vault.</Text>
                                </CardBody>
                                <CardFooter>
                                    <Button colorScheme="blue">View here</Button>
                                </CardFooter>
                            </Card>
                        </SimpleGrid>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default home
